#!/bin/bash
user="annliu" # Your username here
remote="20.108.243.185" # Your section's machine here

# The password for ac_lab_host is T2CnUMhNwG8T2M3
# Use this ONLY for the setup portion.

echo "SSHing to the remote VM..."
ssh -i Test_key.pem ac_lab_host@$remote sudo ./setup_user.sh $user
echo "\nSetup complete!"
