ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

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
	@make -C ./4tran run --no-print-directory $(RUN_ARGS)

.PHONY: run

copy:
	@make -C ./4tran copy --no-print-directory
.PHONY: copy