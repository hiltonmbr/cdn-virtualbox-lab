# 📍 5. Automação com Vagrant

Criar máquinas virtuais clicando em assistentes gráficos no VirtualBox (selecionar ISO, alocar RAM, esperar a instalação rodar) pode se tornar uma tarefa lenta e repetitiva, especialmente quando os ambientes quebram com frequência em testes de Big Data.

O **Vagrant** permite criar ambientes através de código (Infraestrutura como Código - IaC).

## 🤖 Como funciona?

O Vagrant lê um arquivo chamado `Vagrantfile` (escrito em Ruby) e orquestra o VirtualBox silenciosamente (em background) para baixar imagens pré-prontas, configurar redes, pastas e iniciar a VM em minutos.

## 📄 O arquivo Vagrantfile básico

```ruby
Vagrant.configure("2") do |config|
  # Imagem da máquina (Box)
  config.vm.box = "ubuntu/focal64"

  # Configuração de Rede: Port Forwarding
  # Envia a porta 8080 do seu PC para a porta 80 da VM
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Configuração de Rede: IP Fixo
  config.vm.network "private_network", ip: "192.168.33.10"

  # Ajustes de hardware no VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
end
```

## 📝 Comandos essenciais

* `vagrant up` — Inicia e provisiona o ambiente pela primeira vez.
* `vagrant ssh` — Acessa o terminal da VM via SSH sem pedir senhas.
* `vagrant halt` — Desliga a VM com segurança.
* `vagrant destroy` — Apaga a VM e seus discos completamente.
