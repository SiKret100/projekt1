# pawcho_1

# Zbudowanie opracowanego obrazu kontenera 
```docker build -f Dockerfile -t projekt1:v1 --no-cache .```

# Uruchomienie kontenera
```docker run -d -p 81:3000 --name testProjekt projekt1:v1```

# Sprawdzenie uzyskanych 
informacjo, które wygenerował serwer w trakcie uruchamiania kontenera 
```docker logs testProjekt```
<img width="357" alt="Screenshot 2024-05-10 at 13 30 56" src="https://github.com/SiKret100/projekt1/assets/83550480/2e984b62-8579-4541-88a1-e8085cfaaa46">

# Sprawdzenie ile wartstw posiada zbudowany program
```docker history projekt1:v1```
<img width="901" alt="Screenshot 2024-05-10 at 13 31 12" src="https://github.com/SiKret100/projekt1/assets/83550480/18198482-8a10-4a6e-b917-c6d79ca3bd44">

# Sprawdzenie healthcheck
<img width="1396" alt="Screenshot 2024-05-10 at 13 31 26" src="https://github.com/SiKret100/projekt1/assets/83550480/a35d291a-5717-47df-bf8b-2c84a4454e75">

# Test działania aplikacji
<img width="560" alt="Screenshot 2024-05-10 at 13 37 44" src="https://github.com/SiKret100/projekt1/assets/83550480/d8d5920f-39b9-4561-9ec0-09fe1d68d5c4">
