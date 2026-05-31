# 📍 3. Os Modos de Rede do VirtualBox

Entender redes é o diferencial entre um laboratório que funciona e um que falha. O VirtualBox oferece várias modalidades:

| Modo | A VM acessa a Internet? | O Host acessa a VM? | VMs se comunicam? | Uso típico |
|---|---|---|---|---|
| **NAT** | ✅ Sim | ❌ Não | ❌ Não | Navegação básica |
| **Bridge** | ✅ Sim | ✅ Sim | ✅ Sim | VM como servidor na LAN |
| **Host-Only** | ❌ Não | ✅ Sim | ✅ Sim | Rede privada Host-VM |
| **Interna** | ❌ Não | ❌ Não | ✅ Sim | Cluster isolado de VMs |

---

## 🔸 NAT (padrão)
A VM fica oculta atrás de um roteador virtual (VirtualBox). Recebe um IP como `10.0.2.15`.
* **Como funciona:** Traduz o tráfego da VM usando o IP do Host.
* **Vantagem:** Acesso imediato à internet sem configurações.
* **Limitação:** O Host não consegue acessar serviços na VM diretamente (precisa configurar *Port Forwarding*).

## 🔹 Bridge (Placa em Bridge)
A VM conecta-se diretamente à placa física (Wi-Fi/Ethernet) do Host.
* **Como funciona:** O roteador físico da sua casa atribui um IP à VM (ex: `192.168.1.50`).
* **Vantagem:** Conectividade direta e transparente. A VM parece um celular ou PC real na rede.
* **Limitação:** Depende de um servidor DHCP ativo na rede física e pode falhar em redes Wi-Fi corporativas.

## 🟢 Host-Only (Exclusiva de Hospedeiro)
Cria uma placa de rede virtual no Host (ex: `vboxnet0`) conectada à VM.
* **Como funciona:** Comunicação direta por IP entre Host e VM (ex: `192.168.56.x`).
* **Vantagem:** A VM não se expõe à internet, mas o Host consegue fazer SSH nela de forma incrivelmente estável (não cai se o Wi-Fi desconectar).
* **Limitação:** Sem acesso à internet na VM.

## 🔴 Rede Interna (Internal Network)
Cria um switch virtual isolado associando apenas as VMs.
* **Como funciona:** Comunicação direta apenas entre as VMs que compartilham o mesmo "nome de rede".
* **Vantagem:** Isolamento total do Host e da internet — perfeito para simular datacenters isolados ou testar malwares de forma segura.
* **Limitação:** Exige configuração manual de IPs e rotas nas VMs.

---

### 💡 A Técnica Profissional (Dupla Interface)
Para obter o melhor de dois mundos, muitos administradores usam uma configuração com **duas placas de rede**:
* **Adaptador 1 (NAT):** Habilita a VM a baixar pacotes, atualizações e acessar serviços externos.
* **Adaptador 2 (Host-Only):** Cria um canal de rede fixo e seguro para o desenvolvedor fazer conexões SSH ou se conectar ao banco de dados (ex: Postgres/Spark) da VM sem depender de conexões Wi-Fi instáveis.
