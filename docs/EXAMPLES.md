# tydirium Examples

> "I have a bad feeling about this email configuration..."

This document provides examples of using tydirium for various email authentication scenarios.

## Basic Usage

### Check a Domain

```bash
$ tydirium example.com

=== Email Authentication Check for example.com ===
Generated: Thu Jul 17 11:30:00 CDT 2025

✅ SPF: Properly configured
✅ DKIM: 1 selector(s) found
⚠️  DMARC: Present but weak (p=none)
✅ MX: Mail servers configured
```

### Check an Email Address

```bash
$ tydirium luke@rebels.com

# Automatically extracts domain and checks rebels.com
```

## Mode Examples

### Quick Mode (-q)

Perfect for CI/CD pipelines or quick checks:

```bash
$ tydirium -q gmail.com

# Only checks 3 major DNS servers
# Faster but less comprehensive
```

### Verbose Mode (-v)

Get detailed information including:
- Nameserver details
- MX server connectivity tests
- SPF include chain
- Additional security checks (MTA-STS, TLSRPT)

```bash
$ tydirium -v example.com
```

## Common Scenarios

### 1. New Domain Setup

Just configured email for a new domain? Check if everything is working:

```bash
$ tydirium startup.com

=== Email Authentication Check for startup.com ===

❌ SPF: No SPF record found
   → Add SPF record: v=spf1 include:_spf.google.com ~all
❌ DKIM: Not found
   → Go to Google Admin > Apps > Google Workspace > Gmail > Authenticate email
❌ DMARC: Missing
   → Start with: v=DMARC1; p=none; rua=mailto:dmarc@startup.com
```

### 2. Troubleshooting Delivery Issues

Emails going to spam? Check your authentication:

```bash
$ tydirium problem-domain.com

# Look for:
# - SPF with +all (too permissive)
# - Missing DKIM
# - No DMARC policy
# - Blacklisted IPs
```

### 3. DNS Propagation Check

Just updated DNS records? Monitor propagation:

```bash
$ tydirium -q example.com

DKIM Selector: google
DNS Propagation Status:
  ✅ Cloudflare (1.1.1.1)
  ✗ Google (8.8.8.8)
  ✅ OpenDNS (208.67.222.222)
  Propagation: 66% (2/3 servers)
```

### 4. Provider Detection

tydirium automatically detects your email provider:

```bash
$ tydirium company.com

✅ Using Google Workspace/Gmail

=== Google Specific Tips ===
• Check authentication status: admin.google.com > Apps > Gmail > Authenticate email
• Enable 2-step verification for better security
• Consider using Google Postmaster Tools for delivery insights
```

## Advanced Examples

### Check Multiple Domains

```bash
# Using a simple loop
for domain in example.com startup.com company.org; do
    echo "Checking $domain..."
    tydirium -q "$domain" | grep -E "(SPF:|DKIM:|DMARC:)"
    echo
done
```

### Monitor DNS Propagation

```bash
# Check every 5 minutes until DKIM propagates
while ! tydirium -q example.com | grep -q "Propagation: 100%"; do
    echo "Waiting for DNS propagation..."
    sleep 300
done
echo "DNS fully propagated!"
```

### Export Results

```bash
# Save detailed report
tydirium -v example.com > email-auth-report.txt

# Get just the summary
tydirium example.com | grep -A 20 "Summary & Recommendations"
```

## Interpreting Results

### Good Configuration

```
✅ SPF: Properly configured
✅ DKIM: 2 selector(s) found
✅ DMARC: Configured with enforcement
✅ MX: Mail servers configured
```

### Needs Attention

```
⚠️  SPF uses ~all (soft fail)
⚠️  DMARC policy is 'none' (monitoring only)
⚠️  Only one MX record (no redundancy)
```

### Critical Issues

```
❌ No MX records found
❌ SPF uses +all (allows anyone to send)
❌ No DKIM records found
❌ Listed in: Spamhaus
```

## Testing Your Configuration

After running tydirium and fixing any issues:

1. **Send to Gmail** - Check headers for PASS status
2. **Use Port25 Verifier** - Email check-auth@verifier.port25.com
3. **Try Mail-Tester** - Visit mail-tester.com for a score

---

Remember: "Do or do not check your email authentication. There is no try."