FROM mcr.microsoft.com/playwright:v1.30.0-focal as base

WORKDIR /home/node/app

COPY package.json ./
RUN npm install

COPY . .
RUN npx playwright install 

RUN chmod +x ./e2e/scripts/run-tests.sh
ENTRYPOINT ["./e2e/scripts/run-tests.sh"]
