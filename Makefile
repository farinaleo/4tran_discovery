build:
	@make -C ./4tran build --no-print-directory
.PHONY: build

submodules: build # Initialize submodules
	@echo "Initializing submodules"
	@git submodule init
	@git submodule update --init --recursive
.PHONY: submodules

run:
	@make -C ./4tran run --no-print-directory
.PHONY: run

copy:
	@printf "Path to project directory: "
	@read DIRECTORY; \
    cp -r $$DIRECTORY ./4tran/srcs;
.PHONY: copy
