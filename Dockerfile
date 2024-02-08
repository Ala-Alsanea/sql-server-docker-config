FROM mcr.microsoft.com/mssql/server:2019-latest

ARG SA_PASSWORD
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=1234
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433 

WORKDIR /src
COPY ./ /scripts/
RUN chmod +x /scripts/configure-db.sh

EXPOSE 1433 

RUN /opt/mssql/bin/sqlservr --accept-eula & /scripts/configure-db.sh
