Meilisearch::Rails.configuration = {
  meilisearch_url: ENV.fetch('MEILISEARCH_HOST', 'http://localhost:7700'),
  meilisearch_api_key: ENV.fetch('MEILI_MASTER_KEY', 'votre_cle_master'),
  timeout: 2,
  max_retries: 1
}
