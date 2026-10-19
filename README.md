# 🚀 Multi-Platform Bootstrap Scripts

Repositório central de scripts de provisionamento e automação para estações de trabalho e servidores (Fedora, Ubuntu, Debian, Windows).

---

## 💻 Workstations (Desktop)

### Fedora 44 Workstation

Instalação de repositórios oficiais (RPM Fusion, Microsoft, OpenH264), codecs, pacotes nativos (DNF), runtimes do Wine e aplicações via Flatpak.

```bash
curl -fsSL https://raw.githubusercontent.com/thglex/bootstrap/main/desktop/fedora-44.sh | bash

```

---

## 🖥️ Servers

### Ubuntu Server 26.04 LTS

```bash
curl -fsSL https://raw.githubusercontent.com/thglex/bootstrap/main/server/ubuntu-2604.sh | bash

```

---

## 📂 Estrutura do Repositório

```text
bootstrap/
├── desktop/
│   └── fedora-44.sh
└── server/
    └── ubuntu-2604.sh

```

---

## ⚠️ Requisitos

* Acesso de superusuário (`sudo`) no ambiente de destino.
* Conexão ativa com a internet durante a execução.

```

