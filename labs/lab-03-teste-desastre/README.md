# 🧪 Lab 03: Teste de Desastre com Snapshots

## Objetivo
Você precisa realizar um procedimento arriscado de alteração do Python que pode quebrar dependências essenciais do Linux. Usaremos Snapshots para realizar o teste de forma segura.

---

## Passo a Passo

### 1. Criar o Ponto de Restauração
1. Com a VM desligada ou pausada, vá no gerenciador do VirtualBox.
2. Selecione a aba **Snapshots** e clique em **Fazer (Take)**.
3. Nome: `"Antes do Upgrade do Python 3.12"`.

### 2. Simular a Falha Crítica
Inicie a VM e execute comandos destrutivos (removendo o Python base do sistema):
```bash
sudo rm -rf /usr/bin/python3
```
*Resultado:* Várias dependências do Linux param de funcionar imediatamente (ex: o utilitário `apt` vai quebrar, comandos quebram). O sistema pode se tornar inoperante.

### 3. A Restauração Instantânea (Recuperação Pós-Desastre)
1. Desligue a VM à força (clicando no botão fechar a janela -> *Desligar a máquina*).
2. Volte à aba de **Snapshots** no painel do VirtualBox.
3. Clique em `"Antes do Upgrade do Python 3.12"` -> selecione **Restaurar**.
4. Inicie a VM novamente.

**Verificação ✅**
A máquina inicializa em poucos segundos com todos os arquivos do Python nativo perfeitamente restaurados. O desastre foi evitado sem necessidade de reinstalar o SO!
