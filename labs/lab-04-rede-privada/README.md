# 🧪 Lab 04: Rede Privada de VMs

## Objetivo
Simular uma arquitetura multicamadas (ex: servidor Web + Banco de Dados) que conversam apenas entre si. Eles devem ficar invisíveis e inacessíveis para o restante da sua rede doméstica e até mesmo para o Host (para máximo isolamento).

---

## Passo a Passo

### 1. Criando a Infraestrutura
Crie duas VMs com Ubuntu Server:
1. `web-server`
2. `db-server`

Nas configurações de rede de ambas, mude o **Adaptador 1** para **Rede Interna** e defina o nome da rede como `"rede-isolada"`.

> Como elas não terão NAT, não terão acesso à internet.

### 2. Configurando IP Estático
Como a Rede Interna não possui servidor DHCP integrado nativamente no VirtualBox, precisamos definir os IPs manualmente em cada servidor.

**Na VM `web-server`:**
```bash
sudo ip addr add 10.50.0.10/24 dev enp0s3
sudo ip link set dev enp0s3 up
```

**Na VM `db-server`:**
```bash
sudo ip addr add 10.50.0.20/24 dev enp0s3
sudo ip link set dev enp0s3 up
```
*(Nota: O nome da placa `enp0s3` pode variar. Verifique com `ip a`).*

### 3. Teste de Comunicação
Do `web-server`, execute:
```bash
ping 10.50.0.20
```

Se o ping responder, a rede interna isolada foi configurada com sucesso. Nenhuma outra máquina na sua rede ou o seu próprio roteador sabe da existência desses IPs. 

Para tornar isso permanente após a reinicialização no Ubuntu 24.04, modifique os arquivos do Netplan (`/etc/netplan/*.yaml`).
