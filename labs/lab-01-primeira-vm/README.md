# 🧪 Lab 01: A Primeira VM

## Objetivo
Criar uma máquina virtual do zero, montar a imagem ISO, instalar o sistema operacional e realizar as configurações iniciais.

---

## Passo a Passo

1. **Download da ISO**
   Baixe o **Ubuntu Server 24.04 LTS** do site oficial da Canonical.

2. **Criação da VM**
   - Abra o VirtualBox e clique em **Novo**.
   - **Nome:** `lab-ubuntu-server`.
   - **Memória:** 2048 MB.
   - **Processadores:** 2 vCPUs.
   - **Disco Rígido Virtual:** 25 GB, alocação dinâmica.

3. **Montagem da Mídia**
   - Nas **Configurações** da VM, vá em **Armazenamento**.
   - Clique na controladora IDE "Vazio".
   - No painel da direita, clique no ícone de disco óptico e selecione o arquivo ISO baixado.

4. **Instalação**
   - Inicie a VM. Ela dará boot pela ISO.
   - Siga as etapas de instalação do Ubuntu (Idioma, Layout de teclado, Configurações de Rede com DHCP, e criação de usuário e senha).
   - Ao finalizar, o assistente pedirá para reiniciar. 
   - No menu do VirtualBox: *Dispositivos -> Discos Ópticos -> Remover disco da unidade virtual*.

5. **Validação**
   Faça login com seu usuário e execute:
   ```bash
   cat /etc/os-release
   ```
   Deve exibir as informações do Ubuntu Server 24.04.
