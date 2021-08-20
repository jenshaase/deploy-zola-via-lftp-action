# GitHub Action: Deploy Zola via lftp

GitHub Actions that deploys a Zola static site to a server via lftp

## Inputs

### `ftp_host`:
**Required** The FTP hostname

### `ftp_port`:
The FTP port (default 21)

### `ftp_username`:
**Required** The FTP username

### `ftp_password`:
**Required** The FTP password

### `remote_target_dir`:
**Required** The target directory on the server

### `zola_build_dir`:
The build directory of zola (default: public)

## Example usage

```
uses: jenshaase/deploy-zola-via-lftp-action@v1
with:
  ftp_host: 'myhost.com'
  ftp_username: 'my-user'
  ftp_password: 'my-password'
  ftp_remote_target_dir: 'foo/bar'
```
