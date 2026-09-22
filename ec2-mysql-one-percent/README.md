# EC2 MySQL Lab: `one_percent`

Ubuntu EC2 instance named **database-server** running MySQL 8 with three tables from a cloud engineering lab.

## What I built

- Launched a `t3.micro` Ubuntu instance in `us-east-2c`
- Installed and started MySQL
- Created database `one_percent`
- Loaded `coffee_table`, `customer_name`, and `customer_order`
- Limited SSH (port 22) to my IP only
- Terminated the instance when the lab was done so it would not keep billing

## Screenshots

| File | What it shows |
|---|---|
| `screenshots/01-ssh-login-database-server.png` | Logged in over EC2 Instance Connect |
| `screenshots/02-mysql-running.png` | `mysql.service` active (running) |
| `screenshots/03-all-tables.png` | `SHOW TABLES` and `coffee_table` |
| `screenshots/03-all-tables-2.png` | `customer_name` and `customer_order` |
| `screenshots/04-security-group-ssh-my-ip.png` | Inbound SSH from a single /32, not `0.0.0.0/0` |

## Schema

**coffee_table**

| ID | NAME | REGION | ROAST |
|---|---|---|---|
| 1 | default route | ethiopia | light |
| 2 | docker run | mexico | medium |
| 3 | helpdesk | honduras | medium |
| 4 | on-call | peru | dark |
| 5 | ifconfig | tanzania | blonde |
| 6 | traceroute | bali | med-dark |

**customer_name**

| id | first_name | last_name | origin | age | alias |
|---|---|---|---|---|---|
| 1 | thor | odinson | asgard | 1500 | strongest avenger |
| 2 | clint | barton | earth | 35 | hawkeye |
| 3 | tony | stark | earth | 52 | iron man |
| 4 | peter | parker | earth | 17 | spiderman |
| 5 | groot | groot | planet x | 18 | tree |

**customer_order**

| order_num | coffee | customer |
|---|---|---|
| 001 | 1 | 3 |
| 002 | 5 | 1 |
| 003 | 2 | 2 |
| 004 | 4 | 4 |

`order` is a reserved word in MySQL, so the column is `order_num CHAR(3)`.

## Data types

- **INT** — whole numbers. `age INT` stores `35`, `52`, `1500`.
- **VARCHAR(n)** — variable text up to n characters. `first_name VARCHAR(50)` stores `tony`.
- **CHAR(n)** — fixed-length text. `order_num CHAR(3)` stores `001`.
- **DATE** — a calendar day. `order_date DATE` could store `2026-09-21`.
- **TIME** — a clock time. `pickup_time TIME` could store `09:30:00`.
- **DATETIME** — date and time. `created_at DATETIME` could store `2026-09-21 21:55:52`.
- **BOOLEAN** — true or false. `is_paid BOOLEAN` could store `TRUE`.
- **FLOAT** — decimals. `price FLOAT` could store `4.99`.

## SQL, NoSQL, RDS, DynamoDB

SQL uses tables, rows, and columns with a defined schema. This project is SQL: MySQL on EC2.

NoSQL stores documents, key-value pairs, or similar. The shape can change without an ALTER TABLE first.

RDS is AWS-managed SQL (MySQL, PostgreSQL, and others). AWS handles patching and backups. Here I installed MySQL on EC2 myself.

DynamoDB is AWS-managed NoSQL. No server to patch. It scales with traffic and charges per request.

## Commands used

```bash
sudo apt update
sudo apt install mysql-server -y
sudo systemctl status mysql
sudo mysql
```

```sql
CREATE DATABASE one_percent;
USE one_percent;
```

Instance was terminated after screenshots so compute billing stopped.
