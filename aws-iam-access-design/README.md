# AWS IAM Access Design

Identity and access configuration for a small brokerage operations account. The goal was least-privilege access for people and compute, with evidence captured from the AWS console.

## Scope

- Named IAM user for S3-focused operations work
- Developer group with a shared job-function policy
- EC2 instance role for S3 access (no long-lived keys on the host)
- Customer-managed policy limited to one market-data bucket
- Virtual MFA on the operations user

## Layout

```
README.md
policies/
  brokerage-market-data-readonly.json
evidence/
  01-iam-user-created.png
  01-iam-user-permissions.png
  02-iam-group-users.png
  02-iam-group-permissions.png
  03-iam-role-details.png
  03-ec2-s3-ls.png
  04-custom-policy-attached.png
  05-iam-mfa-enabled.png
```

Account identifiers, console passwords, and private keys are omitted from this repository.

## Identities

### Operations user

`s3-readonly-ops` is a console user. Directly attached managed policy: `AmazonS3ReadOnlyAccess`. The user was later added to the developer group and given the customer-managed bucket policy below.

### Developer group

`brokerage-developers` uses the AWS managed job-function policy `PowerUserAccess`. `s3-readonly-ops` is a member. Group assignment keeps shared permissions in one place instead of copying them onto every user.

### EC2 role

`ec2-s3-access-role` is assumable by `ec2.amazonaws.com`. Attached policy: `AmazonS3FullAccess`.

An Amazon Linux instance (`s3-access-demo`, `t3.micro`) used that instance profile. From the host:

```bash
aws s3 ls
```

The command completed without `AccessDenied`, which is the check that the instance received credentials from the role rather than from embedded access keys. The instance was terminated after verification.

## Customer-managed policy

`BrokerageMarketDataReadOnly` grants read access to a single bucket, `brokerage-market-quotes`.

- `s3:ListBucket` on the bucket ARN
- `s3:GetObject` on objects under that bucket

Full document: `policies/brokerage-market-data-readonly.json`.

This is narrower than `AmazonS3ReadOnlyAccess`, which applies to every bucket in the account.

## MFA

A virtual MFA device (`s3-readonly-ops-mfa`) is assigned on the operations user. Console sign-in for that user requires the authenticator code in addition to the password.

## Notes

- Private key material (`.pem`) is stored offline and is not in git.
- S3 bucket ARNs in the policy document do not include an account id. IAM ARNs in screenshots were redacted before publish.
- Resources created only for verification (the demo instance) were removed so they do not continue to bill.
