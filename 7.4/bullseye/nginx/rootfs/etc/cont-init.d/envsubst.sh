#!/command/with-contenv sh

vars=$(env | cut -d= -f1 | awk '{print "${" $1 "}"}')

for conf in /etc/nginx/templates.d/*.conf; do
    envsubst "$vars" < "$conf" | tee "/etc/nginx/http.d/$(basename $conf)"
done
