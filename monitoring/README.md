# Monitoring Stack Using Docker-Compose

## Overview

This monitoring stack utilizes Prometheus for metric collection, AlertManager for handling alerts, Node-Exporter for system metrics, Promtail and Loki for log management, and Grafana for visualization.

## Prerequisites

1. Ensure you have an `.env` file in the same directory as your `docker-compose.yml`. This file should contain the paths to the configuration files for Discord Webhook, and SMTP Google.

        
        DISCORD_WEBHOOK_URL=https://discord.com/api/webhooks/xxxxxx/yyyyyy

        SMTP_HOST=smtp.gmail.com
        SMTP_PORT=587
        SMTP_FROM=your-email@gmail.com
        SMTP_USERNAME=your-email@gmail.com
        SMTP_PASSWORD=your-password


## How to Use

To bring up all services:


    docker-compose up -d


To bring down all services:

```
docker-compose down
```
## View Logs

To view logs for a specific service:


    docker-compose logs -f <service_name>

Example:

    docker-compose logs -f prometheus


And that's all you need to get your monitoring stack up and running.