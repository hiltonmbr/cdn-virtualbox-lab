# 📦 VirtualBox Lab

### **Tutorial completo e prático de Oracle VM VirtualBox**
Do zero à automação de laboratórios locais com o Hypervisor Tipo 2 mais popular do mundo.

![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-1868CE?logo=virtualbox&logoColor=white)
![Vagrant](https://img.shields.io/badge/Vagrant-Automated_VMs-1563FF?logo=vagrant&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?logo=ubuntu&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🎯 O que é este repositório?

Um **laboratório hands-on** para aprender Virtualização Local com VirtualBox. Ideal para estudantes de Ciência de Dados, Engenharia e TI que precisam criar ambientes complexos (como clusters e servidores) nos seus próprios computadores sem formatá-los. 

Cada conceito é ensinado com:

- 📖 **Documentação rica** — explicações detalhadas sobre discos virtuais, redes e integração com o Host.
- 🧪 **Labs práticos** — configurações passo a passo, incluindo bancos de dados isolados e simulação de redes.
- 📜 **Exemplos de Automação** — Infraestrutura como código utilizando Vagrant para provisionar VMs rapidamente.

> **Público-alvo:** Profissionais e estudantes (Ciência de Dados para Negócios) que precisam rodar bancos de dados, clusters Spark/Hadoop e ambientes Linux a partir de máquinas Windows ou macOS.

---

## ⚡ Quick Start (5 minutos)

Se você já tem o VirtualBox e o Vagrant instalados, pode subir sua primeira VM automatizada agora mesmo:

```bash
# 1. Crie um diretório para o teste
mkdir lab-teste && cd lab-teste

# 2. Inicialize um ambiente Vagrant básico com Ubuntu Server
vagrant init ubuntu/focal64

# 3. Suba a máquina virtual (o VirtualBox fará tudo no background)
vagrant up

# 4. Acesse a máquina via SSH
vagrant ssh

# 5. Dentro da VM, verifique o SO
cat /etc/os-release
```

**Parabéns!** 🎉 Você acabou de provisionar e acessar um servidor Linux completo dentro do seu computador.

> 🖥️ **Não tem o VirtualBox instalado ou prefere a interface gráfica?** Comece pela [documentação de instalação](docs/01-instalacao-e-fundamentos.md).

---

## ⚙️ Pré-requisitos

| Requisito | Detalhes |
|---|---|
| **Computador (Host)** | Notebook ou Desktop com Windows, Linux ou macOS (Intel)* |
| **CPU** | Processador AMD (AMD-V) ou Intel (VT-x) com virtualização ativada na BIOS/UEFI |
| **RAM** | Mínimo 8 GB (recomendado: 16 GB+ para rodar múltiplas VMs com fluidez) |
| **Disco** | 20 GB a 50 GB livres para alocar discos virtuais (`.vdi`) |
| **Imagens (ISO)** | Arquivo ISO de um sistema (ex: Ubuntu Server 24.04 LTS) |

> ⚠️ **Atenção Usuários de macOS (Apple Silicon M1/M2/M3/M4):** O VirtualBox possui limitações em processadores ARM. Para MacBooks com Apple Silicon, recomenda-se o uso do **UTM** (QEMU) ou **Parallels Desktop** com imagens ARM64.

---

## 🗺️ Mapa de Aprendizagem

O conteúdo está organizado em **documentação conceitual** + **labs práticos**:

### 📖 Documentação

| # | Módulo | Tópicos | Link |
|---|---|---|---|
| 01 | **Fundamentos & Instalação** | Hypervisor Tipo 2, Extension Pack, Hardware, VBox vs Proxmox | [📖 Ler](docs/01-instalacao-e-fundamentos.md) |
| 02 | **Anatomia de uma VM** | Arquivos `.vbox` e `.vdi`, discos dinâmicos vs fixos | [📖 Ler](docs/02-anatomia-da-vm.md) |
| 03 | **Modos de Rede** | NAT, Bridge, Host-Only, Rede Interna e dupla interface | [📖 Ler](docs/03-modos-de-rede.md) |
| 04 | **Ferramentas Avançadas** | Snapshots e Guest Additions (integração Host-Guest) | [📖 Ler](docs/04-ferramentas-avancadas.md) |
| 05 | **Automação com Vagrant** | Vagrantfile, provisionamento, IaC básico para ambientes de dev | [📖 Ler](docs/05-automacao-vagrant.md) |

### 🧪 Labs Práticos

| # | Lab | Abordagem | O que faz | Tempo | Link |
|---|---|---|---|---|---|
| 01 | **A Primeira VM** | Básica | Criar VM Ubuntu Server do zero via interface gráfica, montar ISO | 20 min | [🧪 Ir](labs/lab-01-primeira-vm/README.md) |
| 02 | **Banco de Dados Isolado** | Intermediário | VM com PostgreSQL conectada ao Host (DataGrip/DBeaver) via Bridge/Host-Only | 30 min | [🧪 Ir](labs/lab-02-banco-isolado/README.md) |
| 03 | **Simulando um Desastre** | Administração | Quebrar o Python nativo da VM e recuperá-la instantaneamente com Snapshots | 15 min | [🧪 Ir](labs/lab-03-teste-desastre/README.md) |
| 04 | **Rede Privada de VMs** | Avançado | Isolar um servidor Web e um servidor de BD numa Rede Interna | 40 min | [🧪 Ir](labs/lab-04-rede-privada/README.md) |
| 05 | **Vagrant e IaC** | DevOps | Subir e configurar ambientes reprodutíveis sem tocar na interface do VBox | 25 min | [🧪 Ir](labs/lab-05-vagrant-iac/README.md) |

---

## 📂 Estrutura do Repositório

```text
cdn-virtualbox-lab/
│
├── 📖 docs/                                 # Documentação conceitual
│   ├── 01-instalacao-e-fundamentos.md
│   ├── 02-anatomia-da-vm.md
│   ├── 03-modos-de-rede.md
│   ├── 04-ferramentas-avancadas.md
│   └── 05-automacao-vagrant.md
│
├── 🧪 labs/                                 # Exercícios práticos guiados
│   ├── lab-01-primeira-vm/
│   ├── lab-02-banco-isolado/
│   ├── lab-03-teste-desastre/
│   ├── lab-04-rede-privada/
│   └── lab-05-vagrant-iac/
│
├── 📜 scripts/                              # Scripts auxiliares e exemplos
│   └── setup-host-only.sh
│
├── 📋 .gitignore                            # Arquivos pesados omitidos (ISO/VDI)
└── 📋 README.md                             # ← Você está aqui
```

---

## 🔑 Conceitos-Chave

| Conceito | Descrição |
| :--- | :--- |
| **🖥️ Hypervisor Tipo 2** | Diferente do Proxmox, o VirtualBox roda **sobre** o seu sistema operacional (Windows/Mac/Linux). É um "Hosted Hypervisor". |
| **💾 .vdi (Virtual Disk Image)** | O formato padrão de disco do VirtualBox. Pode ser de *Alocação Dinâmica* (cresce sob demanda) ou *Tamanho Fixo* (melhor I/O). |
| **🌐 NAT (Padrão)** | A VM acessa a internet "escondida" atrás do Host. O Host **não** consegue acessá-la facilmente (útil apenas para navegar e baixar pacotes). |
| **🌐 Placa em Bridge** | A VM conecta-se diretamente à placa física (Wi-Fi/Cabo) do Host. Recebe IP do seu roteador, como se fosse um novo computador na sua casa. |
| **🌐 Rede Host-Only** | Cria uma placa virtual no Host conectada diretamente à VM. Perfeito para manter uma conexão SSH estável do seu notebook para a VM, mas sem internet na VM. |
| **📸 Snapshots** | A "máquina do tempo". Congela o estado exato da VM (RAM e Disco) permitindo reversão imediata. Ideal usar antes de configurações perigosas. |
| **🎁 Guest Additions** | Pacote de drivers instalado **dentro** da VM. Habilita redimensionamento fluido de tela, área de transferência (Copiar/Colar) e pastas compartilhadas. |
| **🤖 Vagrant** | Ferramenta da HashiCorp para construir e manter ambientes virtuais reprodutíveis através de arquivos declarativos (`Vagrantfile`). |

---

## 📝 Cheatsheet Rápido (VBoxManage e Vagrant)

```bash
# ══════════════════════════════════════════════
#  📋 VIRTUALBOX & VAGRANT — CHEATSHEET
# ══════════════════════════════════════════════

# ── VBoxManage (CLI oficial do VirtualBox) ──
vboxmanage list vms                            # Lista todas as VMs criadas
vboxmanage list runningvms                     # Lista VMs em execução
vboxmanage startvm "Nome-da-VM" --type headless # Inicia a VM sem interface gráfica (background)
vboxmanage controlvm "Nome-da-VM" poweroff     # Desliga a VM forçadamente
vboxmanage snapshot "Nome-da-VM" take "Backup" # Cria um snapshot da VM
vboxmanage snapshot "Nome-da-VM" restore "Backup" # Restaura o snapshot

# ── Vagrant (IaC para VirtualBox) ──
vagrant init ubuntu/focal64                    # Cria um Vagrantfile com Ubuntu 20.04
vagrant up                                     # Baixa a imagem (se necessário) e sobe a VM
vagrant ssh                                    # Acessa a VM provisionada via SSH
vagrant halt                                   # Desliga a VM graciosamente
vagrant reload                                 # Reinicia a VM (aplicando mudanças)
vagrant destroy -f                             # Apaga a VM e libera todos os recursos
vagrant status                                 # Mostra o status atual do ambiente
```

---

## 📚 Referências

- [Oracle VM VirtualBox User Manual](https://www.virtualbox.org/manual/UserManual.html) — Documentação oficial abrangente.
- [Vagrant — VirtualBox Provider](https://developer.hashicorp.com/vagrant/docs/providers/virtualbox) — Automação de ambientes.
- SILBERSCHATZ, A.; GALVIN, P. B.; GAGNE, G. **Operating System Concepts**. 10ª ed. Wiley, 2018. Cap. 18.

---

## 📄 Licença

Este material é de uso educacional. Criado para a disciplina de **Ciência de Dados para Negócios** — UFPB.

---

> **📦 O Laboratório Pessoal: Teste infraestruturas completas de Big Data no conforto do seu notebook, sem medo de errar.**
