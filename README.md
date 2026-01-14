# Sistema de Gestão de Pagamentos e Relatórios Contábeis

## 📌 Descrição do Projeto
Este projeto consiste em uma aplicação web desenvolvida em Python com o framework Flask, voltada para o gerenciamento de pagamentos duplicatas e geração automatizada de relatórios contábeis. O sistema foi desenvolvido como Trabalho de Conclusão de Curso (TCC) do curso de Sistemas de Informação.

A aplicação permite o controle de usuários com diferentes níveis de acesso, registro de pagamentos, geração de relatórios em PDF com assinatura digital, exportação de dados em múltiplos formatos e envio automático de relatórios por e-mail.

---

## 🎯 Objetivo
Automatizar o processo de registro, organização e consolidação de pagamentos, reduzindo tarefas manuais e oferecendo relatórios financeiros confiáveis, seguros e prontos para uso contábil.

---

## 🧑‍💼 Perfis de Usuário
- **Administrador (admin)**  
  Gerencia clientes, usuários, bases de dados e configurações gerais do sistema.

- **Cliente**  
  Registra pagamentos, consulta lançamentos e gera relatórios financeiros.

---

## ⚙️ Funcionalidades Principais
- Autenticação e controle de acesso por perfil
- Cadastro, edição e exclusão de pagamentos
- Filtros por período, método de pagamento e destinatário
- Geração automática de relatórios em PDF
- Assinatura digital dos relatórios (hash SHA-256)
- Exportação de dados em PDF, JSON e TXT
- Envio automático de relatórios por e-mail
- Backup e restauração de dados via arquivos ZIP
- Cabeçalhos de segurança HTTP
- Hash seguro de senhas

---

## 🏗️ Arquitetura do Sistema
A aplicação segue um modelo baseado no padrão **MVC simplificado**:

- **Model**: Camada de persistência encapsulada no módulo `db.py`
- **View**: Templates HTML utilizando Jinja2
- **Controller**: Rotas Flask responsáveis pela lógica da aplicação

---

## 🛠️ Tecnologias Utilizadas
- **Python 3**
- **Flask**
- **SQLite**
- **ReportLab** (geração de PDFs)
- **Werkzeug Security** (hash de senhas)
- **SMTP (Gmail)** para envio de e-mails
- **HTML / CSS / Jinja2**
- **Git** para versionamento

---

## 🔐 Segurança
- Senhas armazenadas utilizando hash criptográfico
- Controle de sessão por usuário autenticado
- Headers de segurança HTTP
- Assinatura digital em relatórios para garantir integridade

---

## 📄 Geração de Relatórios
Os relatórios em PDF incluem:
- Identificação do cliente
- Período de referência
- Resumo executivo
- Agrupamento por método de pagamento e destinatário
- Tabela detalhada de lançamentos
- Assinatura digital única

---

