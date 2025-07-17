# tydirium Examples

This directory contains examples of using tydirium to check email authentication.

## Basic Usage

### Check a domain
```bash
tydirium example.com
```

### Check an email address
```bash
tydirium user@example.com
```

## Quick Mode

For faster checks using only 3 DNS servers:
```bash
tydirium -q example.com
```

## Verbose Mode

For detailed output including raw DNS records:
```bash
tydirium -v example.com
```

## Common Scenarios

### 1. Setting up a new domain

When setting up email for a new domain, run tydirium to verify:
```bash
tydirium -v mydomain.com
```

Look for:
- ✅ SPF record exists and is valid
- ✅ DKIM keys are found (check with your email provider for selectors)
- ✅ DMARC policy is set (even if just monitoring)
- ✅ MX records point to your mail server

### 2. Troubleshooting delivery issues

If emails are going to spam:
```bash
tydirium -v problematic-domain.com
```

Check for:
- ⚠️ SPF failures or missing records
- ⚠️ DKIM not found or invalid
- ⚠️ DMARC policy too weak or missing
- ❌ IP addresses on blacklists

### 3. Monitoring DNS propagation

After making DNS changes:
```bash
# Check propagation across all DNS servers
tydirium yourdomain.com

# Quick check on main providers only
tydirium -q yourdomain.com
```

## Understanding the Output

### SPF Record
```
✅ SPF: Properly configured
```
- Look for `v=spf1` at the beginning
- Should end with `-all` (fail) or `~all` (soft fail)
- May include `include:` statements for third-party senders

### DKIM Record
```
✅ DKIM: 1 selector(s) found
  DKIM Selector: google
  ✓ Key length: ~2048 bits (strong)
```
- Key length of 1024 bits is acceptable, 2048 is better
- Common selectors: google, default, dkim, k1, selector1

### DMARC Record
```
⚠️ DMARC: Present but weak (p=none)
```
- `p=none` - Monitoring only
- `p=quarantine` - Send to spam
- `p=reject` - Block delivery

## Tips

1. **Always check after DNS changes** - Records can take up to 48 hours to propagate
2. **Use verbose mode for debugging** - Shows raw DNS responses
3. **Check from different locations** - Use the full DNS server list to verify global propagation
4. **Save output for records** - Useful for comparing before/after states:
   ```bash
   tydirium -v example.com > example-auth-check.txt
   ```