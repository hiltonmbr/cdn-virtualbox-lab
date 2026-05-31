# 📍 4. Ferramentas Avançadas

## 📸 Snapshots: A Máquina do Tempo

Um **Snapshot** congela o estado exato da sua máquina virtual naquele instante. Se a VM quebrar no futuro, você pode restaurá-la instantaneamente.

> Pense no snapshot como o salvamento de um jogo eletrônico antes de enfrentar um "chefe de fase". Se falhar, basta recarregar o ponto salvo.

### ✅ Quando tirar um Snapshot:
* Antes de executar atualizações críticas (`apt upgrade` ou `dist-upgrade`).
* Antes de instalar pacotes experimentais, compilar kernels ou ferramentas complexas de Big Data.
* Assim que finalizar a instalação limpa do SO ("Golden Image").

### ⚠️ Cuidados importantes:
* **Não é Backup:** Se o seu disco físico falhar, você perde a VM e todos os Snapshots.
* **Espaço em Disco:** Cada snapshot cria arquivos "diferenciais" (`.vdi` encadeados) que crescem infinitamente com o tempo. 
* **Desempenho:** Longas cadeias de snapshots prejudicam severamente a velocidade de I/O do disco da VM. Remova snapshots antigos consolidados!

---

## 🎁 Guest Additions: A Experiência Suave

O **Guest Additions** é um pacote de utilitários e drivers que roda dentro do sistema convidado (Guest), melhorando a integração com o Host.

| Funcionalidade | Sem Guest Additions | Com Guest Additions |
|---|---|---|
| **Integração do Mouse** | Cursor "preso" na janela da VM | Movimento livre entre telas |
| **Área de Transferência** | Isolada e sem comunicação | Bidirecional (Copiar/Colar) |
| **Resolução de Tela** | Resoluções fixas (ex: 800x600) | Redimensionamento fluido dinâmico |
| **Pastas Compartilhadas** | Exige configuração de rede complexa (NFS/SMB) | Acesso direto a pastas do Host |

### Instalando Guest Additions no Ubuntu Server (sem interface)

Como não temos interface gráfica para "clicar no instalador", faremos via terminal:

```bash
# 1. Instalar dependências de compilação
sudo apt update && sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# 2. No VirtualBox: menu Dispositivos -> Inserir Imagem do CD dos Adicionais...

# 3. Montar e rodar
sudo mount /dev/cdrom /media
sudo /media/VBoxLinuxAdditions.run

# 4. Reiniciar a VM para carregar os novos módulos
sudo reboot
```
