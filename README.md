# pawcho_1

# Zbudowanie opracowanego obrazu kontenera 
```docker build -f Dockerfile -t projekt1:v1 --no-cache .```

# Uruchomienie kontenera
```docker run -d -p 81:3000 --name testProjekt projekt1:v1```

# Sprawdzenie uzyskanych informacjo, które wygenerował serwer w trakcie uruchamiania kontenera 
```docker logs testProjekt```

# Sprawdzenie ile wartstw posiada zbudowany program
```docker history projekt1:v1```

# Sprawdzenie healthcheck


# Test działania aplikacji
