# 📍 2. Anatomia e Criação de uma VM

Quando criamos uma VM, o VirtualBox gera uma pasta contendo os seguintes elementos principais:

* **Arquivo de Configuração (`.vbox`):** Um arquivo XML contendo todas as definições de hardware da VM (quantidade de RAM, vCPUs, ordem de boot, interfaces de rede).
* **Disco Rígido Virtual (`.vdi` - Virtual Disk Image):** O arquivo que simula o HD ou SSD da máquina convidada.

---

## 💾 Tipos de Disco `.vdi`

### Alocação Dinâmica
O arquivo `.vdi` começa muito pequeno e cresce dinamicamente conforme você instala arquivos no sistema convidado.
* **Vantagem:** Economiza espaço no seu disco rígido físico.
* **Recomendação:** Use para quase todos os laboratórios acadêmicos e de aprendizado.

### Tamanho Fixo
Aloca todo o espaço definido no Host imediatamente (ex: cria um arquivo de 25 GB de uma só vez).
* **Vantagem:** Oferece performance ligeiramente superior de leitura e escrita (I/O).
* **Recomendação:** Use apenas se for rodar testes de benchmark de banco de dados ou processamento paralelo intenso com Spark local.

---

## ⚙️ Dimensionamento de Hardware (Recomendações)

| Recurso | Mínimo (Linux Server) | Mínimo (Windows Desktop) |
|---|---|---|
| **Memória RAM** | 1 GB a 2 GB | 4 GB |
| **vCPUs** | 1 a 2 vCPUs | 2 vCPUs |
| **Disco** | 10 GB a 25 GB | 50 GB |

> ⚠️ **Atenção:** Evite alocar mais de 50% da sua RAM física ou mais de 50% dos seus núcleos de processamento físicos, senão o seu próprio Host (seu computador) vai ficar lento e comprometer o desempenho geral.
