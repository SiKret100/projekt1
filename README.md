# pawcho_1

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

<img width="280" alt="Screenshot 2024-05-10 at 13 45 32" src="https://github.com/SiKret100/projekt1/assets/83550480/17d17aa7-dd07-43d7-871c-32e5f99214a1">
<img width="826" alt="Screenshot 2024-05-10 at 13 45 23" src="https://github.com/SiKret100/projekt1/assets/83550480/2ff2f8ed-5491-4f41-b31d-f017e1349e68">

