#!/bin/bash -e

curl -o search_index.json https://raw.githubusercontent.com/mahiya/deploy-to-azure-test/main/assets/search_index.json

curl -X PUT https://$searchServiceName.search.windows.net/indexes/$searchServiceIndexName?api-version=$searchServiceApiVersion \
    -H 'Content-Type: application/json' \
    -H 'api-key: '$searchServiceApiKey \
    -d "$(sed -e "s|{{VECTORIZER_RESOURCE_URI}}|$openAIServiceAccountEndpoint|; \
                  s|{{VECTORIZER_API_KEY}}|$openAIServiceAccountKey|; \
                  s|{{VECTORIZER_DEPLOYMENT_ID}}|$openAIServiceEmbeddingsDeployName|;" \
                  "search_index.json")"
