################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/bsp/driver/i2c_controller/i2c_master.c 

OBJS += \
./src/bsp/driver/i2c_controller/i2c_master.o 

C_DEPS += \
./src/bsp/driver/i2c_controller/i2c_master.d 


# Each subdirectory must supply rules for building sources it contributes
src/bsp/driver/i2c_controller/%.o: ../src/bsp/driver/i2c_controller/%.c src/bsp/driver/i2c_controller/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU RISC-V Cross C Compiler'
	riscv-none-embed-gcc -march=rv32imc -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -DLSCC_STDIO_UART_APB -I"C:\Users\javos\workspace\riscv_mc_hello/src" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/gpio" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/i2c_controller" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/riscv_mc" -I"C:\Users\javos\workspace\riscv_mc_hello/src/bsp/driver/uart" -std=gnu11 --specs=picolibc.specs -DPICOLIBC_INTEGER_PRINTF_SCANF -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


