# Release Automation Setup

The release workflow automatically updates the Homebrew formula when you create a new release. To enable this, you need to set up authentication.

## Option 1: Fine-grained Personal Access Token (Simplest)

1. Go to https://github.com/settings/tokens?type=beta
2. Click "Generate new token"
3. Set:
   - Token name: `tydirium-homebrew-updater`
   - Expiration: 90 days (or longer)
   - Repository access: Select only `agentstation/homebrew-tap`
   - Permissions: 
     - Contents: Read and Write
     - Metadata: Read (automatically selected)
4. Generate token and copy it
5. In tydirium repo settings → Secrets → Actions:
   - Add secret named `HOMEBREW_TAP_TOKEN`
   - Paste the token value

## Option 2: Deploy Key (More Secure)

1. Generate SSH key pair:
   ```bash
   ssh-keygen -t ed25519 -f homebrew-tap-deploy-key -N ""
   ```

2. Add public key to homebrew-tap:
   - Go to homebrew-tap → Settings → Deploy keys
   - Add key with write access
   - Title: `tydirium-release-automation`
   - Key: Contents of `homebrew-tap-deploy-key.pub`

3. Add private key to tydirium:
   - Go to tydirium → Settings → Secrets → Actions
   - Add secret named `HOMEBREW_TAP_DEPLOY_KEY`
   - Value: Contents of `homebrew-tap-deploy-key` (private key)

4. Update workflow to use `ssh-key` instead of `token`

## Option 3: GitHub App (Organization-wide)

Best for organization-wide automation:

1. Create GitHub App:
   - Go to Organization settings → Developer settings → GitHub Apps
   - New GitHub App with:
     - Name: `AgentStation Release Bot`
     - Permissions: Contents (Read & Write)
     - Only install on select repositories

2. Install app on both repositories

3. Add app credentials to tydirium secrets:
   - `APP_ID`: Your app's ID
   - `APP_PRIVATE_KEY`: Your app's private key

4. Use the app token workflow example

## Testing

After setup, create a new release to test:
```bash
git tag v1.2.1
git push origin v1.2.1
```

The workflow should automatically update the Homebrew formula!