declare -a arr=("api" "corp" "dev" "uat" "test" "stag" "sandbox" "prod" "internal")
for i in "${arr[@]}"
do
	curl -s https://crt.sh/\?q\=$i.$1\&output\=json | jq -r '.[].name_value' | sed 's/\\*//g' | sort -u | tee -a subdomains/$1-crtsh.txt

cat subdomains/$1-crtsh.txt | rev | cut -d "."  -f 1,2,3 | sort -u | rev > ./subdomains/raw/$1-raw.txt
done