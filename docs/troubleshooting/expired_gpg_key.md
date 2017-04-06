## Updating an Expired GPG Key


We set our GPG signing keys to be valid for only a few years at a time.

If you exprience an expired key on your servers you will need to update it.

### Apt


```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 113E2B8D
```
