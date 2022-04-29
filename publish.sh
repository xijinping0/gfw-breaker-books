#!/bin/bash
# author: gfw-breaker

git pull

index=README.md
base='http://78.141.195.254:10000/videos/books'

## README page
cat > $index << EOF
### 禁书下载

---
##### 友情链接：[免翻墙看禁闻](https://github.com/gfw-breaker/banned-news3) &nbsp;|&nbsp; [翻墙软件下载](https://github.com/gfw-breaker/nogfw)

| 书名 | 下载 | 下载 | 下载 |
|---|---|---|---|
EOF

## generate
while read line; do
	key=$(echo $line | cut -d',' -f1)
	name=$(echo $line | cut -d',' -f2)
	txt='-'
	pdf='-'
	epub='-'
	if [ -f resources/$key.txt ]; then
		txt="[TXT格式]($base/$key.txt)"
	fi
	if [ -f resources/$key.pdf ]; then
		pdf="[PDF格式]($base/$key.pdf)"
	fi
	if [ -f resources/$key.epub ]; then
		epub="[EPUB格式]($base/$key.epub)"
	fi
	echo "| 《$name》 | $txt | $pdf | $epub |" >> $index
done < index.csv

## commit
#git add *
git commit -m "ok"
git push


