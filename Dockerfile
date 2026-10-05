FROM node:22-alpine AS source
WORKDIR /src
COPY opengym-source.tar.gz /tmp/source.tar.gz
RUN tar -xzf /tmp/source.tar.gz -C /src

# Same Node API + nginx frontend, packaged together for a single managed web service.
FROM node:22-alpine AS frontend
WORKDIR /src/frontend
COPY --from=source /src/frontend/package.json /src/frontend/package-lock.json ./
RUN npm ci --ignore-scripts
COPY --from=source /src/api/coach/core /src/api/coach/core
COPY --from=source /src/api/screenshot-import /src/api/screenshot-import
COPY --from=source /src/frontend/ ./
RUN APP_BUILD=zh-cn-cloud-preview npm run build

FROM node:22-alpine
RUN apk add --no-cache nginx bash git gettext ca-certificates && adduser -D -H -s /sbin/nologin coach
WORKDIR /app/api
COPY --from=source /src/api/package.json /src/api/package-lock.json ./
RUN npm ci --omit=dev --omit=optional && npm cache clean --force
COPY --from=source /src/api/ ./
COPY --from=frontend /src/frontend/dist /usr/share/nginx/html
COPY --from=source /src/web/nginx.conf.template /app/nginx.conf.template
COPY --from=source /src/scripts/fetch-media.sh /app/scripts/fetch-media.sh
COPY --from=source /src/private/cloud/entrypoint.sh /app/entrypoint.sh
COPY --from=source /src/private/cloud/public-origin.mjs /app/public-origin.mjs
ENV NODE_ENV=production DATA_BACKEND=supabase COACH_DISABLED=1 DATA_DIR=/var/data/api
EXPOSE 10000
CMD ["bash","/app/entrypoint.sh"]
