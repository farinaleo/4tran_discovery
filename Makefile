Arguments := $(filter-out $@,$(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS)))


build:
	@make -C ./4tran build --no-print-directory
.PHONY: build

submodules: # Initialize submodules
	@echo "Initializing submodules"
	@git submodule init
	@git submodule update --init --recursive
	@echo "Submodules initialized"
.PHONY: submodules

run:
	-@make -C ./4tran run --no-print-directory $(Arguments) 2>/dev/null || true

.PHONY: run

copy:
	@make -C ./4tran copy --no-print-directory
.PHONY: copy

.SILENT:
%::
	@true