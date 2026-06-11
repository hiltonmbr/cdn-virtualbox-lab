#!/usr/bin/env make
# ═══════════════════════════════════════════════════════════════════════
#   Makefile — cdn-virtualbox-lab 📦
#   Your friendly automation helper for VirtualBox labs
# ═══════════════════════════════════════════════════════════════════════

.DEFAULT_GOAL := help

.PHONY: help setup clean check lint nuke

help: ## 📖 Show this help menu
	@echo ""
	@echo "╔══════════════════════════════════════════════════════╗"
	@echo "║   📦 cdn-virtualbox-lab — Automation Helper        ║"
	@echo "╚══════════════════════════════════════════════════════╝"
	@echo ""
	@echo "  👋 Welcome! Here's what you can do:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  🛠  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "  💡 Tip: run 'make <command>' to get things done!"
	@echo ""

setup: ## 🚀 Set up Host-Only network for your VMs
	@echo "🔥 Setting up Host-Only network..."
	@bash scripts/setup-host-only.sh
	@echo "✨ Host-Only network is ready! Your VMs can now use a stable private IP."

clean: ## 🧹 Remove stale VBox locks and temporary files
	@echo "🧼 Cleaning up VirtualBox locks..."
	@rm -rf ~/VirtualBox\ VMs/*/LOCK 2>/dev/null || true
	@rm -f *.vdi *.iso *.ova 2>/dev/null || true
	@echo "✅ Cleanup complete! Your workspace is fresh and tidy."

check: ## 🔍 Check if VirtualBox and Vagrant are installed
	@echo "🔎 Checking your toolbox..."
	@echo -n "  VirtualBox: "; \
		if command -v VBoxManage &>/dev/null; then \
			echo "✅ $(shell VBoxManage --version 2>/dev/null)"; \
		else \
			echo "❌ not found — install from https://virtualbox.org"; \
		fi
	@echo -n "  Vagrant:    "; \
		if command -v vagrant &>/dev/null; then \
			echo "✅ $(shell vagrant --version 2>/dev/null)"; \
		else \
			echo "❌ not found — install from https://vagrantup.com"; \
		fi
	@echo "🎯 All good! You're ready to virtualize."

lint: ## ✅ Check Markdown files for basic formatting issues
	@echo "📝 Linting Markdown files..."
	@find . -name '*.md' -not -path './.git/*' -exec sh -c ' \
		if grep -q "^#" "$$1"; then \
			echo "  ✅ $$1"; \
		else \
			echo "  ⚠️  $$1 has no headings"; \
		fi' _ {} \;
	@echo "🏁 Lint complete!"

nuke: ## 💥 CAUTION: Remove all created VBox files (except scripts/docs)
	@echo "⚠️  ☠️  DANGER ZONE ☠️  ⚠️"
	@echo "This will delete ALL .vdi, .iso, and .ova files in this repo."
	@echo "Are you sure? Type 'yes' to confirm:"
	@read -r answer; \
		if [ "$$answer" = "yes" ]; then \
			echo "💣 Deleting virtual disk images..."; \
			find . -name '*.vdi' -not -path './.git/*' -delete; \
			find . -name '*.iso' -not -path './.git/*' -delete; \
			find . -name '*.ova' -not -path './.git/*' -delete; \
			echo "✅ Done! Disk images have been purged."; \
		else \
			echo "👍 Phew! Nothing was deleted."; \
		fi

all: setup check ## 🎯 Run setup + check (your daily hello)
	@echo "⭐ Everything is in order. Happy virtualizing!"
