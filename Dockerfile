# Używamy pustego obrazu scratch jako podstawy do zbudowania naszego obrazu
FROM scratch AS builder

# Dodajemy mini system plików Alpine Linux do naszego obrazu.
ADD alpine-minirootfs-3.19.1-aarch64.tar /

# Ustawiamy argument VERSION, który będzie używany do określenia wersji aplikacji. Możemy przekazać wartość tego argumentu podczas budowy obrazu.
ARG VERSION

# Ustawiamy /usr/app jako katalog roboczy, gdzie będziemy przechowywać nasze pliki aplikacji
WORKDIR /usr/app

# Aktualizujemy indeks pakietów i instalujemy Node.js oraz npm w kontenerze
RUN apk update && apk add nodejs npm

# Kopiujemy plik package.json z lokalnego katalogu src do katalogu roboczego w kontenerze
COPY ./src/package.json ./

# Uruchamiamy npm install, aby zainstalować zależności wymienione w package.json
RUN npm install

# Kopiujemy główny plik aplikacji serwera, server.js, z lokalnego katalogu src do katalogu roboczego w kontenerze
COPY ./src/server.js ./

# Rozpoczynamy nowy etap budowy od obrazu Alpine Linux w najnowszej wersji
FROM alpine:latest

# Ponownie ustawiamy argument VERSION i domyślnie przypisujemy mu wartość "1.0.0" jeśli nie został określony podczas budowy
ARG VERSION
ENV APP_VERSION=${VERSION:-1.0.0}

# Kopiujemy skompilowaną aplikację z etapu builder do katalogu /usr/app w naszym końcowym obrazie
COPY --from=builder /usr/app /usr/app

# Aktualizujemy indeks pakietów i instalujemy Node.js w końcowym obrazie
RUN apk update && apk add nodejs

# Ustawiamy /usr/app jako katalog roboczy w końcowym obrazie
WORKDIR /usr/app

# Informujemy Docker, że kontener nasłuchuje na porcie 81
EXPOSE 81

# Ustawiamy polecenie, które uruchomi naszą aplikację Node.js przy starcie kontenera
CMD node server.js  

#HEALTHCHECK, sprawdza, czy nasza aplikacja działa poprawnie.
HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=5 \
    CMD wget -q --spider http://localhost:3000 || exit 1
