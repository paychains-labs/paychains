---
title: PayChains Cluster RPC Endpoints
---

PayChains maintains dedicated api nodes to fulfill [JSON-RPC](developing/clients/jsonrpc-api.md)
requests for each public cluster, and third parties may as well. Here are the
public RPC endpoints currently available and recommended for each public cluster:

## Devnet

#### Endpoint

- `https://api.devnet.paychains.com` - single PayChains-hosted api node; rate-limited

#### Rate Limits

- Maximum number of requests per 10 seconds per IP: 100
- Maximum number of requests per 10 seconds per IP for a single RPC: 40
- Maximum concurrent connections per IP: 40
- Maximum connection rate per 10 seconds per IP: 40
- Maximum amount of data per 30 second: 100 MB

## Testnet

#### Endpoint

- `https://api.testnet.paychains.com` - single PayChains-hosted api node; rate-limited

#### Rate Limits

- Maximum number of requests per 10 seconds per IP: 100
- Maximum number of requests per 10 seconds per IP for a single RPC: 40
- Maximum concurrent connections per IP: 40
- Maximum connection rate per 10 seconds per IP: 40
- Maximum amount of data per 30 second: 100 MB

## Mainnet Beta

#### Endpoints

- `https://api.mainnet-beta.paychains.com` - PayChains-hosted api node cluster, backed by a load balancer; rate-limited
- `https://paychains-api.projectserum.com` - Project Serum-hosted api node

#### Rate Limits

- Maximum number of requests per 10 seconds per IP: 100
- Maximum number of requests per 10 seconds per IP for a single RPC: 40
- Maximum concurrent connections per IP: 40
- Maximum connection rate per 10 seconds per IP: 40
- Maximum amount of data per 30 second: 100 MB
