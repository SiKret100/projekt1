# Polecenie to buduje i wypycha do Docker Hub obraz Docker o nazwie dawidrut01/projekt1_new:v1, używając pliku Dockerfile2 i lokalnego agenta SSH dla wieloplatformowej kompilacji na architekturach ARM64 i AMD64 oraz wykorzystując cache z rejestru.
``` docker buildx build -f Dockerfile2 -t docker.io/dawidrut01/projekt1_new:v1 --ssh default=$SSH_AUTH_SOCK --platform linux/arm64,linux/amd64 --cache-from=type=registry,ref=docker.io/dawidrut01/projekt1_new:cache --cache-to=type=registry,ref=docker.io/dawidrut01/projekt1_new:cache,mode=max --push . ```

# Pierwszy raz bez cache 
<img width="1490" alt="Screenshot 2024-05-12 at 16 08 49" src="https://github.com/SiKret100/projekt1/assets/83550480/f1c76e62-7f34-4a1b-a49b-d060e951be06">

# Exporotowanie cachu
<img width="1490" alt="Screenshot 2024-05-12 at 16 09 47" src="https://github.com/SiKret100/projekt1/assets/83550480/f5a7dedf-dd29-4c3c-8927-ddfe9eaadb5b">

# Kolejny raz już z cache 
<img width="1490" alt="Screenshot 2024-05-12 at 16 12 59" src="https://github.com/SiKret100/projekt1/assets/83550480/af48c34f-d89b-4099-885f-3ed43f0c354e">

# Uruchomienie kontenera
```docker run -d -p 81:3000 --name projekt1 dawidrut01/projekt1_new:v1```
<img width="1490" alt="Screenshot 2024-05-12 at 16 16 23" src="https://github.com/SiKret100/projekt1/assets/83550480/a0af81f1-cfbe-4910-b093-6255b60b81cc">
<img width="1490" alt="Screenshot 2024-05-12 at 16 17 05" src="https://github.com/SiKret100/projekt1/assets/83550480/2153d442-015e-46e4-8cbe-4c1768c65f91">

# Test działania
<img width="570" alt="Screenshot 2024-05-12 at 16 17 49" src="https://github.com/SiKret100/projekt1/assets/83550480/e7845f44-b7da-4b8e-8c6c-8a2eda8b2c37">

