# Telegram Pictionary It

[@pictionaryitbot](https://t.me/pictionaryitbot) is a Telegram Mini App online game in which players can draw and guess pictures.

## Demo

Send any message to [@pictionaryitbot](https://t.me/pictionaryitbot) and follow the instructions.

![Demo of the gameplay](assets/demo.gif).

Instructions:
1. Send the Mini App to a **group** chat: https://t.me/pictionaryitbot/play.
2. Ask players to open the link.
3. Press start when everyone is ready.
4. One player receives a word and should draw it. All other players don't know the word and need to guess it by the drawing.
5. The round ends when everyone guesses correctly or time up.
6. If a user has any problem, this user will be out of the round and then can join again, but their score will be lost.

## Requirements

- [docker](https://www.docker.com/products/docker-desktop/).
- [make](https://en.wikipedia.org/wiki/Make_(software)).

## Running

### Prepare config

```
cp .env.example .env
```
> Don't modify it yet.

### Prepare Ngrok

> This stage prepares a tunnel from your localhost to the Internet.

1. Login in https://ngrok.com.
2. Get your ngrok token:
    ![ngrok token](assets/ngrok-token.png)
3. Write this token to `NGROK_AUTHTOKEN` in [.env](.env).
4. Go to "Cloud Edge" -> "Domains" and create a new domain:
    ![ngrok domain](assets/ngrok-domain.png)
5. Write the domain to `DOMAIN` in [.env](.env).

### Prepare Telegram Bot

> This stage creates a new telegram bot and a new telegram mini app.

1. Send `/newbot` to [@BotFather](https://t.me/BotFather).
2. Enter any name.
3. Write bot token to `TELEGRAM_BOT_TOKEN` in [.env](.env).
4. Create a new mini app: `/newapp`.
5. Enter any title.
6. Enter a short description of the web app.
7. Please upload a photo, 640x360 pixels. You can use [this one](assets/undraw_art_cover.png).
8. Skip gif: `/empty`.
9. Send the Web App URL: `https://<YOUR_NGROK_DOMAIN>`.
10. Send a short name of the Web App, for example: "play".

### Prepare and run code

1. Clone this repository with submodules:
    ```shell
    git clone --recurse-submodules git@github.com:hedhyw/telegram-pictionary-it
    ```
2. Start docker-compose:
    ```shell
    make up

    # Or if you want to use local backend and frontend, then run with `sudo`:
    make up.dev
    ```
    > Make sure that the port 8081 is available on your machine.
3. That is it! Try to send a message to your bot and follow instructions.
    > If you see the message "This website is served for free through ngrok.com".
    >
    > Just Ignore it, click "Visit site".

### Cleaning up

1. Stop docker-compose:

    ```shell
    make down
    ```
2. Delete the telegram bot:
    send `/deletebot` to [@BotFather](https://t.me/BotFather).
3. Delete your ngrok domain:
   https://dashboard.ngrok.com/cloud-edge/domains
