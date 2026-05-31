# 📍 1. Fundamentos e Instalação

## 📦 O que é o VirtualBox?
O **VirtualBox** é um poderoso produto de virtualização x86/AMD64 gratuito e de código aberto (GPLv2), mantido pela Oracle. É o Hypervisor Tipo 2 mais popular do mundo para uso em desenvolvimento e educação.

**Hypervisor Tipo 2 (Hosted):** Instalado **sobre o seu Sistema Operacional** (o *Host*). Ele intercepta as chamadas do SO convidado (*Guest*) ao hardware físico e as traduz, criando uma ilusão perfeita de uma máquina separada.

### Por que o VirtualBox?
* **Gratuito** para uso pessoal e educacional.
* **Multiplataforma**: Comportamento idêntico no Windows, macOS e Linux.
* **VBoxManage**: API de linha de comando para automatizar a criação e gestão de VMs via scripts.

---

## 💻 Instalação

### 🪟 Microsoft Windows
Baixe em: [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
* Execute o instalador `.exe` e siga o assistente padrão.
* **Conflito comum:** Se o VirtualBox falhar ao iniciar VMs, desative o **Hyper-V** do Windows.

### 🍎 Apple macOS (Intel)
* Monte o arquivo `.dmg` e execute o instalador `.pkg`.
* **Segurança:** Será necessário aprovar as "Extensões de Sistema" (System Extensions) criadas pela Oracle nas configurações de *Privacidade e Segurança* do macOS.

### 🐧 Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install virtualbox virtualbox-ext-pack
# Adicione seu usuário ao grupo para usar dispositivos USB
sudo usermod -aG vboxusers $USER
```

---

## ⚙️ VirtualBox Extension Pack

O **Extension Pack** é um pacote essencial baixado separadamente no site oficial. Ele habilita:
* **Suporte a USB 2.0 e 3.0:** Permite passar pendrives ou adaptadores Wi-Fi para a VM.
* **VirtualBox RDP:** Acesso remoto à console da VM usando clientes RDP padrão.
* **Criptografia de Disco:** Protege os arquivos `.vdi`.

> ⚠️ **Dica de Ouro:** Sempre mantenha o Extension Pack na exata mesma versão do VirtualBox instalado.
