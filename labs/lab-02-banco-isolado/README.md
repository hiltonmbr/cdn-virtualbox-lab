# 🧪 Lab 02: Banco de Dados Isolado

## Objetivo
Você quer testar um banco PostgreSQL no Linux sem poluir seu sistema operacional (Windows/macOS). O cliente de banco de dados (DataGrip, DBeaver) instalado no seu *Host* precisa conseguir se conectar à VM de forma estável.

---

## Passo a Passo

### 1. Configuração de Rede
Crie uma VM com Ubuntu Server. 
* Nas configurações de rede do VirtualBox, troque o Adaptador 1 de NAT para **Placa em Modo Bridge** (selecione sua placa Wi-Fi ativa) OU adicione um **Adaptador 2** como **Host-Only** (preferencial para evitar mudanças de IP).

### 2. Identificando o IP
Inicie a VM e execute no terminal:
```bash
ip addr show
```
Anote o IP (ex: `192.168.1.104` ou `192.168.56.10`).

### 3. Instalação do PostgreSQL e Liberação de Acesso
```bash
# Instala o banco
sudo apt update && sudo apt install -y postgresql

# Configura o PostgreSQL para escutar conexões externas
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf

# Adiciona permissão de conexão na rede (Substitua a sub-rede pela sua)
echo "host all all 192.168.0.0/16 md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf

# Defina a senha do usuário postgres
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'suasenhaforte';"

# Reinicia o serviço
sudo systemctl restart postgresql
```

### 4. Conexão pelo Host
1. Abra o **DBeaver** ou **DataGrip** no seu computador Host.
2. Crie uma nova fonte de dados PostgreSQL.
3. Preencha os dados:
   * **Host:** `192.168.x.x` (IP da VM obtido no Passo 2)
   * **Porta:** `5432`
   * **Database:** `postgres`
   * **Usuário:** `postgres`
4. Clique em *Test Connection*.

**Sucesso!** O banco está isolado, mas plenamente acessível como se estivesse no seu computador.
