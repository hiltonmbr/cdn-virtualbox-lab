# 🧪 Lab 05: Vagrant e IaC

## Objetivo
Construir um servidor web Apache funcional executando em uma VM provisionada 100% via código em questão de minutos, sem tocar na interface do VirtualBox.

---

## Passo a Passo

### 1. Preparação
Crie uma pasta no seu computador Host:
```bash
mkdir lab-webserver
cd lab-webserver
```

### 2. O Vagrantfile
Crie um arquivo chamado `Vagrantfile` dentro da pasta com o seguinte conteúdo:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Script de provisionamento para rodar assim que a VM ligar
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
    echo "<h1>Laboratorio Vagrant Funcional</h1>" > /var/www/html/index.html
  SHELL
end
```

### 3. Execução
No terminal (da mesma pasta do `Vagrantfile`), execute:
```bash
vagrant up
```
O Vagrant vai:
1. Baixar a imagem do Ubuntu (se for a primeira vez).
2. Criar a VM no VirtualBox.
3. Configurar a rede NAT e o encaminhamento da porta 8080.
4. Executar o shell script (instalação do Apache).

### 4. Teste Final
Abra o navegador no seu próprio PC e acesse:
`http://localhost:8080`

Aparecerá a página **Laboratorio Vagrant Funcional**, hospedada magicamente na máquina virtual, gerenciada via código!
