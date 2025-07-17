#!/bin/bash
# Example: Check multiple domains

domains=(
    "example.com"
    "test.com"
    "mycompany.com"
)

echo "Checking email authentication for multiple domains..."
echo "================================================="

for domain in "${domains[@]}"; do
    echo ""
    echo "Checking $domain..."
    tydirium -q "$domain" | grep -E "(SPF:|DKIM:|DMARC:|Propagation:)"
    echo "-------------------------------------------------"
done

echo ""
echo "Done! For detailed results, run: tydirium -v <domain>"