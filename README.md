# vpn-infra

## Adding a config

| Location  | Public IP | Allocated Range | Public Key |
| ------------- | ------------- | ------------- | ------------- |
| `SN3` | `199.170.132.43` | `10.70.249.0/24 & 10.70.250.0/24` | `HCYsMu1Wztk8ape2WP5HYiFZnNpn07guRNvKZw/e0mk=` |
| `SN10` | `23.158.16.28` | `10.70.247.0/24` | `wFQXW68D0ePLU39A1yfuIRH7oyH3ZIfb424OczjI7Ak=` |

_NOTE: Site-to-site configurations should use allocated IP range `10.70.183.0/24` on both sides of the link._

### Add a road warrior config

1. Generate a public private keypair. `wg genkey | tee yourname_privatekey | wg pubkey > yourname_publickey`
2. Add a new entry to [ansible/wireguard_sn3.yaml](./ansible/wireguard_sn3.yaml) for SN3, or [ansible/wireguard_sn10.yaml](./ansible/wireguard_sn10.yaml) for SN10

| Key  | Description | Restrictions |
| ------------- | ------------- | ------------- |
| `NAME`  | Name of the interface  | Should be letters and numbers |
| `PORT`  | Port number for the wireguard interface | Should be a unique number |
| `PEER_PUBLIC_KEY` | Your public key | Should be a wireguard **public** key  |
| `INTERFACE_ADDRESS` | Address for the wireguard interface | Should be a unique `/31` in the assigned range (`10.70.250.0/24`). |
| `PEER_ALLOWED_IPS` | IPs allowed to connect. Default `0.0.0.0/0`. | IP range |
| `PEER_PERSISTENT_KEEPALIVE` | Persistent keepalive. Default `25`. | Integer |
| `PEER_ENDPOINT` | Optional - adds Endpoint for use as a client. | String (e.g. `199.170.132.43:51820`) |
| `BFD_ENABLE` | Optional - enables BFD for interface. Default `false` | Bool (`true`/`false`) |
| `BFD_INTERVAL` | Optional - sets BFD interval. Default `200ms` | String (e.g. `200ms`) |
| `BFD_MULTIPLIER` | Optional - sets BFD multiplier. Default `5` | Integer |

3. Open a pull request in this repository with your changes.

4. After your pull request is created, a build will automatically run. If it fails, correct the configuration issue.

5. A volunteer will merge your pull request, you can then [set up your device](https://wiki.nycmesh.net/books/5-networking/page/wireguard-vpn-setup-guide) and start using it.

## Add a remote hub config

1. Generate a public private keypair. `wg genkey | tee nn000_privatekey | wg pubkey > nn000_publickey`
2. Add a new entry to [ansible/wireguard_sn3.yaml](./ansible/wireguard_sn3.yaml) for SN3, or [ansible/wireguard_sn10.yaml](./ansible/wireguard_sn10.yaml) for SN10

| Key  | Description | Restrictions |
| ------------- | ------------- | ------------- |
| `NAME`  | Name of the interface  | Should be nn000 where 000 is your NN |
| `PORT`  | Port number for the wireguard interface | Should be a unique number |
| `PEER_PUBLIC_KEY` | Your public key | Should be a wireguard **public** key  |
| `INTERFACE_ADDRESS` | Address for the wireguard interface | Should be a unique `/30` in the assigned range (`10.70.250.0/24`). |
| `NEIGHBORS` | Neighbor IP address  | An IP address |
| `TX_LENGTH` | MTU. The default is `1420`.  | Should be a unique number |
| `COST` | The OSPF cost of the link from the VPN server to your remote hub. The default is `100`.  | Should be a unique number |
| `PEER_ALLOWED_IPS` | IPs allowed to connect. Default `0.0.0.0/0`. | IP range |
| `PEER_PERSISTENT_KEEPALIVE` | Persistent keepalive. Default `25`. | Integer |
| `BFD_ENABLE` | Optional - enables BFD for interface. Default `false` | Bool (`true`/`false`) |
| `BFD_INTERVAL` | Optional - sets BFD interval. Default `200ms` | String (e.g. 200ms) |
| `BFD_MULTIPLIER` | Optional - sets BFD multiplier. Default `5` | Integer |

3. Open a pull request in this repository with your changes.

4. After your pull request is created, a build will automatically run. If it fails, correct the configuration issue.

5. A volunteer will merge your pull request, you can then [set up your device](https://wiki.nycmesh.net/books/5-networking/page/wireguard-vpn-setup-guide) and start using it.
