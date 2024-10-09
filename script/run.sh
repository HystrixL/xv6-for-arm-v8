echo run armv8 without qemu.log

clear

if [ -z "$1" ]
then
      KERNEL_NAME=kernel.elf
else
      KERNEL_NAME=kernel-$1.elf
fi

qemu-system-aarch64 -machine virt -cpu cortex-a57 \
  -machine type=virt -m 128 -nographic \
  -kernel $KERNEL_NAME
# -singlestep

# skip: -singlestep
# try skip -cpu, as str r0, [fp,#-8] not write onto mem
# -cpu cortex-a15
# -s              shorthand for -gdb tcp::1234
# -S freeze at startup
