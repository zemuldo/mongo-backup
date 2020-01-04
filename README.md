# mongo-backup
Docker image that runs MongoDB backup script using `mongodump`

## Example: 

Here is an example compose file.

```yaml
version: "3.7"
services:
  mongo:
    image: 'mongo'
    ports:
      - "27017:27017"
    container_name: mongo
    image: mongo:latest
    volumes:
      - ./db:/data/db
    networks:
      - mongo-network

  backup:
    image: 'zemuldo/mongo-backup'
    environment:
      MONGO_URI: "mongodb://mongo:27017/test"
      CRON_TIME: "0 0 * * *"
      MAX_BACKUPS: "3"
      INIT_BACKUP: "yes"
    restart: always
    volumes:
      - ./backup:/backup
    container_name: backup

    networks:
      - mongo-network

networks:
  mongo-network:
    external: true
```
