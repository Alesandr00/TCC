from flask import Flask, request, redirect, url_for, session, render_template
from werkzeug.security import generate_password_hash, check_password_hash
from datetime import datetime
import hashlib
import db

app = Flask(__name__)

# =====================================================
# ASSINATURA DIGITAL (INTEGRIDADE DO RELATÓRIO)
# =====================================================

def gerar_assinatura_digital(usuario, total):
    base = f"{usuario}|{total}|{datetime.now()}"
    return hashlib.sha256(base.encode()).hexdigest()[:16].upper()

# =====================================================
# AUTENTICAÇÃO
# =====================================================

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        usuario = request.form["usuario"]
        senha = request.form["senha"]

        cliente = db.get_client_by_usuario(usuario)

        if cliente and check_password_hash(cliente["senha"], senha):
            session["usuario"] = cliente["usuario"]
            session["tipo"] = cliente["tipo"]
            return redirect(url_for("dashboard"))

    return render_template("login.html")

# =====================================================
# DASHBOARD
# =====================================================

@app.route("/dashboard")
def dashboard():
    if "usuario" not in session:
        return redirect(url_for("login"))

    pagamentos = db.list_payments_by_usuario(session["usuario"])
    total = sum(p["valor"] for p in pagamentos)
    assinatura = gerar_assinatura_digital(session["usuario"], total)

    return render_template(
        "dashboard.html",
        pagamentos=pagamentos,
        total=total,
        assinatura=assinatura
    )

# =====================================================
# CADASTRO DE PAGAMENTO
# =====================================================

@app.route("/pagamento", methods=["POST"])
def novo_pagamento():
    if "usuario" not in session:
        return redirect(url_for("login"))

    db.add_payment(
        session["usuario"],
        request.form["metodo"],
        float(request.form["valor"]),
        request.form["data"]
    )

    return redirect(url_for("dashboard"))

# =====================================================
# MAIN
# =====================================================

if __name__ == "__main__":
    db.init_db()

    # cria admin padrão (apenas para demonstração acadêmica)
    if not db.get_client_by_usuario("admin"):
        db.add_client(
            "admin",
            generate_password_hash("admin"),
            "admin"
        )

    app.run(debug=True)
