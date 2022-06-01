# terraform-aks

State comes first, then you have a remote backend for everything else.


## Hub and Spoke DNS configuration

After deploying the Hub:

```bash
# ssh into pihole server
ssh -i ~/.ssh/id_rsa azureuser@<IP>

# install pihole, very secure way
curl -sSL https://install.pi-hole.net | bash
```

1. Configure default options, disable blacklist, choose custom upstream DNS: `168.63.129.16`
2. Login to http://PUBLIC-IP/admin with the password given to you at the end of setup
3. Settings > Interface settings > "Permit all origins"
4. Uncheck the two "Never forward..." boxes.

In azure portal, navigate to the hub vnet that was created. Click on DNS Servers, and flip it to Custom DNS. Use `10.0.0.4`, which is the private IP for the above DNS server we just threw together.

Deploy the spoke, then a private cluster on top of it.

Private clusters (and other Private Endpoint resources) make use of Azure's special DNS resolvers (`168.63.129.16`) and Private DNS Zones which can only be read by those special resolvers. Zones must be linked to vnets that need to use them, and AKS must be able to write records into the Zone so that it's nodes can find it's API server and join the cluster.