# ─── Competitive Programming Makefile ────────────────────────
.PHONY: help new run debug test stress clean

SHELL := /bin/bash
SCRIPTS := ./scripts

help:
	@echo "┌─────────────────────────────────────────────────┐"
	@echo "│  Competitive Programming — Commandes            │"
	@echo "├─────────────────────────────────────────────────┤"
	@echo "│  make new    LANG=cpp NAME=2050A                │"
	@echo "│  make run    LANG=cpp NAME=2050A                │"
	@echo "│  make debug  LANG=cpp NAME=2050A                │"
	@echo "│  make test   LANG=cpp NAME=2050A                │"
	@echo "│  make stress LANG=cpp NAME=2050A ITER=1000      │"
	@echo "│  make clean  LANG=cpp NAME=2050A                │"
	@echo "└─────────────────────────────────────────────────┘"

new:
	@$(SCRIPTS)/new.sh $(LANG) $(NAME)

run:
	@$(SCRIPTS)/run.sh $(LANG) $(NAME)

debug:
	@$(SCRIPTS)/debug.sh $(LANG) $(NAME)

test:
	@$(SCRIPTS)/test.sh $(LANG) $(NAME)

stress:
	@$(SCRIPTS)/stress.sh $(LANG) $(NAME) $(or $(ITER),100)

clean:
	@rm -rf $(LANG)/$(NAME)/build $(LANG)/$(NAME)/build-debug
	@echo "🧹 Cleaned build dirs for $(LANG)/$(NAME)"
