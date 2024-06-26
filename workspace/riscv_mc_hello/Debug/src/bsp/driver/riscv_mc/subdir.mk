################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/bsp/driver/riscv_mc/cache.c \
../src/bsp/driver/riscv_mc/exit.c \
../src/bsp/driver/riscv_mc/interrupt.c \
../src/bsp/driver/riscv_mc/iob.c \
../src/bsp/driver/riscv_mc/pic.c \
../src/bsp/driver/riscv_mc/reg_access.c \
../src/bsp/driver/riscv_mc/timer.c \
../src/bsp/driver/riscv_mc/util.c 

S_UPPER_SRCS += \
../src/bsp/driver/riscv_mc/crt0.S 

OBJS += \
./src/bsp/driver/riscv_mc/cache.o \
./src/bsp/driver/riscv_mc/crt0.o \
./src/bsp/driver/riscv_mc/exit.o \
./src/bsp/driver/riscv_mc/interrupt.o \
./src/bsp/driver/riscv_mc/iob.o \
./src/bsp/driver/riscv_mc/pic.o \
./src/bsp/driver/riscv_mc/reg_access.o \
./src/bsp/driver/riscv_mc/timer.o \
./src/bsp/driver/riscv_mc/util.o 

S_UPPER_DEPS += \
./src/bsp/driver/riscv_mc/crt0.d 

C_DEPS += \
./src/bsp/driver/riscv_mc/cache.d \
./src/bsp/driver/riscv_mc/exit.d \
./src/bsp/driver/riscv_mc/interrupt.d \
./src/bsp/driver/riscv_mc/iob.d \
./src/bsp/driver/riscv_mc/pic.d \
./src/bsp/driver/riscv_mc/reg_access.d \
./src/bsp/driver/riscv_mc/timer.d \
./src/bsp/driver/riscv_mc/util.d 


# Each subdirectory must supply rules for building sources it contributes
src/bsp/driver/riscv_mc/%.o: ../src/bsp/driver/riscv_mc/%.c src/bsp/driver/riscv_mc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DLSCC_STDIO_UART_APB -I"C:\Users\javos\workspace\riscv_mc_hello/src" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/gpio" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/i2c_controller" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/riscv_mc" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/uart" -std=gnu11 --specs=picolibc.specs -DPICOLIBC_INTEGER_PRINTF_SCANF -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/bsp/driver/riscv_mc/%.o: ../src/bsp/driver/riscv_mc/%.S src/bsp/driver/riscv_mc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross Assembler'
	riscv-none-embed-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


