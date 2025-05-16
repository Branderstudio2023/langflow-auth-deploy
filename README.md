# Langflow + Basic Auth on Fly.io

This project runs [Langflow](https://github.com/logspace-ai/langflow) behind an Nginx proxy with HTTP Basic Authentication. It's ready for deployment via Fly.io using "Launch from GitHub".

## Default Accounts

| Username | Password      |
|----------|---------------|
| Ting     | brander2023   |
| Spring   | brander2023   |
| Bubble   | brander2023   |

## How to use

1. Push this repo to GitHub.
2. Go to [Fly.io](https://fly.io) > Launch app from GitHub.
3. Configure VM (RAM, region, etc.) through UI.
4. After deployment, open your URL and log in with the above credentials.

## Notes

- Make sure to protect your credentials or move `.htpasswd` to Fly.io secrets for production use.