# Least-privilege policy for application workloads
path "secret/data/payment-service/*" {
  capabilities = ["read"]
}

path "database/creds/payment-role" {
  capabilities = ["read"]
}

path "sys/renew/*" {
  capabilities = ["update"]
}

