mkdir -p ./prisma/temp

for file in ./prisma/models/*.prisma; do
    sed '/\/\/@relations/,$d' "$file" > "./prisma/temp/$(basename "$file")"
done

cat ./prisma/root.prisma ./prisma/temp/*.prisma > ./prisma/schema.prisma
rm -rf ./prisma/temp