# vpn-infra

## Adding a config

### Add a road warrior config

1. Generate a public private keypair. `wg genkey | tee yourname_privatekey | wg pubkey > yourname_publickey`
2. Add a new entry to [ansible/wireguard.yaml](./ansible/wireguard.yaml)

| Key  | Description | Restrictions |
| ------------- | ------------- | ------------- |
| `NAME`  | Name of the interface  | Should be letters and numbers |
| `PORT`  | Port number for the wireguard interface | Should be a unique number |
| `PEER_PUBLIC_KEY` | Your public key | Should be a wireguard **public** key  |
| `INTERFACE_ADDRESS` | Address for the wireguard interface | Should be a unique `/31` in the assigned range (`10.70.250.0/24`). |
| `INTERFACE_NETMASK` | Netmask for the interface  | `255.255.255.254` |

3. Open a pull request in this repository with your changes.

4. After your pull request is created, a build will automatically run. If it fails, correct the configuration issue.

5. A volunteer will merge your pull request, you can then set up your device and start using it.
