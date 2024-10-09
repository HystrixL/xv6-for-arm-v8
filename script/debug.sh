# 指定要遍历的目录
DIRECTORY="usr"
OUTPUT_FILE="connect.gdb"

> "$OUTPUT_FILE"

# 遍历目录下以 _ 开头的文件
for file in "$DIRECTORY"/_*
do
    # 检查文件是否存在
    if [ -e "$file" ]; then
        echo "add-symbol-file $DIRECTORY/$(basename "$file")" >> "$OUTPUT_FILE"
    fi
done

echo "" >> "$OUTPUT_FILE"
echo "add-symbol-file kernel.elf" >> "$OUTPUT_FILE"
echo "set arch aarch64" >> "$OUTPUT_FILE"
echo "target remote tcp::1234" >> "$OUTPUT_FILE"

gdb-multiarch -x connect.gdb
