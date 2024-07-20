#!/bin/bash -e

curl -X PUT https://$searchServiceName.search.windows.net/indexes/$searchServiceIndexName?api-version=2020-06-30 \
    -H 'Content-Type: application/json' \
    -H 'api-key: '$searchServiceApiKey \
    -d "$(sed -e "s|{{VECTORIZER_RESOURCE_URI}}|$openAIServiceAccountEndpoint|; \
                  s|{{VECTORIZER_API_KEY}}|$openAIServiceAccountKey|; \
                  s|{{VECTORIZER_DEPLOYMENT_ID}}|$openAIServiceEmbeddingsDeployName|;" \
                  "search_index.json")"
