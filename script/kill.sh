if [ -z "$1" ]
then
      KERNEL_NAME=kernel.elf
else
      KERNEL_NAME=kernel-$1.elf
fi

pgrep -f -n $KERNEL_NAME | xargs kill