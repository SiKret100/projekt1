## Podstawowe

# Zbudowanie opracowanego obrazu kontenera 
```docker build -f Dockerfile -t projekt1:v1 --no-cache .```

# Uruchomienie kontenera
```docker run -d -p 81:3000 --name testProjekt projekt1:v1```

# Sprawdzenie uzyskanych informacjo, które wygenerował serwer w trakcie uruchamiania kontenera 
```docker logs testProjekt```

<img width="357" alt="Screenshot 2024-05-10 at 13 30 56" src="https://github.com/SiKret100/projekt1/assets/83550480/2e984b62-8579-4541-88a1-e8085cfaaa46">

# Sprawdzenie ile wartstw posiada zbudowany program
```docker history projekt1:v1```

<img width="901" alt="Screenshot 2024-05-10 at 13 31 12" src="https://github.com/SiKret100/projekt1/assets/83550480/18198482-8a10-4a6e-b917-c6d79ca3bd44">

# Sprawdzenie healthcheck
<img width="1396" alt="Screenshot 2024-05-10 at 13 31 26" src="https://github.com/SiKret100/projekt1/assets/83550480/a35d291a-5717-47df-bf8b-2c84a4454e75">

# Test działania aplikacji
<img width="560" alt="Screenshot 2024-05-10 at 13 37 44" src="https://github.com/SiKret100/projekt1/assets/83550480/d8d5920f-39b9-4561-9ec0-09fe1d68d5c4">

# Dodanie obrazu do Docker Huba oraz generowanie Software Bill of Materials (SBOM)
```docker buildx build -f Dockerfile -t dawidrut01/projekt1:v1 --sbom=true --provenance=mode=max  --push .```

# Analiza i identyfikacja podatności
```docker scout cves dawidrut01/projekt1:v1```

<img width="284" alt="Screenshot 2024-05-10 at 13 53 23" src="https://github.com/SiKret100/projekt1/assets/83550480/407ac642-a45f-49fe-9791-c5f0c6fb88bd">
<img width="827" alt="Screenshot 2024-05-10 at 13 52 51" src="https://github.com/SiKret100/projekt1/assets/83550480/de055931-c237-4b74-be1d-b1bc5feb28b2">

## Dodatkowe # Polecenie to buduje i wypycha do Docker Hub obraz Docker o nazwie dawidrut01/projekt1_new:v1, używając pliku Dockerfile2 i lokalnego agenta SSH dla wieloplatformowej kompilacji na architekturach ARM64 i AMD64 oraz wykorzystując cache z rejestru.
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



