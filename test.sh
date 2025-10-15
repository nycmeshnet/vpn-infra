#!/bin/bash
set -e
cd ansible/
ansible-playbook tests.yaml --extra-vars 'env_file=dev.yaml expected_range=10.70.248.0/24 expected_default=10.70.248.1'
ansible-playbook tests.yaml --extra-vars 'env_file=wireguard_sn10.yaml expected_range=10.70.247.0/24 expected_default=10.70.247.1'
ansible-playbook tests.yaml --extra-vars 'env_file=wireguard_sn3.yaml expected_range=10.70.249.0/24,10.70.250.0/24 expected_default=10.70.250.1'
