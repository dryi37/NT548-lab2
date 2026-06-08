# Lab 2 — AWS Infrastructure với CI/CD

Kế thừa hạ tầng từ Lab 1, bổ sung pipeline CI/CD tự động qua **GitHub Actions**.

---

## Cấu trúc pipeline

| Job | Trigger | Mô tả |
|-----|---------|--------|
| `checkov` | push / PR vào `main` | Quét bảo mật Terraform |
| `terraform` | sau `checkov` pass | Plan (PR) hoặc Plan + Apply (push vào `main`) |

---

## Cấu hình GitHub Secrets

Vào **Settings → Secrets and variables → Actions**, thêm 2 secrets:

| Secret | Giá trị |
|--------|---------|
| `AWS_ACCESS_KEY_ID` | Access key của IAM user |
| `AWS_SECRET_ACCESS_KEY` | Secret key của IAM user |

> IAM user cần quyền tạo VPC, EC2, Security Group.

---

## Cấu hình Terraform backend (S3)

`backend.tf` dùng S3 để lưu state. Tạo bucket trước khi chạy pipeline:

```bash
aws s3api create-bucket \
  --bucket lab-2-terraform-state \
  --region ap-southeast-1 \
  --create-bucket-configuration LocationConstraint=ap-southeast-1

# Bật versioning để rollback state
aws s3api put-bucket-versioning \
  --bucket lab-2-terraform-state \
  --versioning-configuration Status=Enabled
```

---

## Chạy thủ công (local)

```bash
cd terraform

terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

# Xóa hạ tầng
terraform destroy -var-file="terraform.tfvars"
```

---

## Chạy qua GitHub Actions

**Pull Request → `main`:** chạy Checkov + `terraform plan` (chỉ preview, không apply).

**Push / Merge vào `main`:** chạy Checkov + `terraform plan` + `terraform apply` tự động.

```
push code → PR vào main → Checkov scan → terraform plan
merge vào main           → Checkov scan → terraform plan → terraform apply
```