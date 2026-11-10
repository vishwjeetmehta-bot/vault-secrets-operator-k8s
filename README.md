<div align="center">

# 🔐 Zero-Trust HashiCorp Vault on Kubernetes

[![HashiCorp Vault](https://img.shields.io/badge/HashiCorp_Vault-v1.16-000000?style=for-the-badge&logo=vault&logoColor=white)](https://www.vaultproject.io/)
[![External Secrets Operator](https://img.shields.io/badge/External_Secrets-v0.9%2B-2088FF?style=for-the-badge&logo=kubernetes&logoColor=white)](https://external-secrets.io/)
[![Azure Key Vault](https://img.shields.io/badge/Auto--Unseal-Azure_Key_Vault-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](./LICENSE)

<p align="center">
  <b>Enterprise Zero-Trust secret management pattern integrating HashiCorp Vault with Kubernetes via External Secrets Operator (ESO), Cloud HSM auto-unseal, and dynamic PostgreSQL short-lived credential rotation.</b>
</p>

</div>

---

## 🏛️ Architecture & Secret Flow

```
┌─────────────────────────────────┐
│ Azure Key Vault KMS (Auto-Unseal)│
└────────────────┬────────────────┘
                 ▼
┌─────────────────────────────────┐
│ HashiCorp Vault HA Cluster      │ <──── Dynamic DB Secret Engine (PostgreSQL)
└────────────────┬────────────────┘
                 │ mTLS (ServiceAccount Token Authentication)
                 ▼
┌─────────────────────────────────┐
│ External Secrets Operator (ESO) │
└────────────────┬────────────────┘
                 │ Synchronizes native K8s Secret (Rotated every 1h)
                 ▼
┌─────────────────────────────────┐
│ Application Workload Pod        │
│  - Environment variables        │
│  - Mounted volume               │
└─────────────────────────────────┘
```

---

## 📁 Repository Contents

```
vault-secrets-operator-k8s/
├── .github/workflows/ci.yml         # Manifest validation pipeline
├── terraform/                       # Azure KeyVault Auto-Unseal setup
│   └── main.tf
├── kubernetes/external-secrets/     # ESO CRDs (ClusterSecretStore, ExternalSecret)
│   ├── secretstore-vault.yaml
│   └── externalsecret-database.yaml
├── policies/                        # Least-privilege HCL policies
│   └── app-policy.hcl
└── README.md
```

---

## 👤 Author

**Vishwjeet Kumar Mehta**  
Senior DevOps & DevSecOps Consultant | Cloud & Infrastructure Architect  
- **LinkedIn**: [linkedin.com/in/vishwjeet-mehta](https://www.linkedin.com/in/vishwjeet-mehta/)  
- **GitHub**: [@vishwjeetmehta-bot](https://github.com/vishwjeetmehta-bot)

