echo "-------------EASY INSTALL AWS CLI--------------"
echo "this script saves you a lot of aws doc reading time"
echo "downloading awscli"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
echo "unzip awscli.zip"
unzip awscliv2.zip
echo "installing..."
sudo ./aws/install
echo "creating shell profile"
sudo touch /etc/profile.d/aws_cli.sh
echo "export PATH=/usr/local/bin:$PATH" |sudo tee -a /etc/profile.d/aws_cli.sh
source /etc/profile.d/aws_cli.sh
echo "deleting decompressed folder and zip file"
rm -r aws/
rm awscliv2.zip
echo "enabling aws cli completion..."
echo "complete -C '/usr/local/bin/aws_completer' aws"|sudo tee -a .bashrc
echo "enabling auto_prompt"
aws configure set cli_auto_prompt one
echo "DONE"
echo "you can now run `aws configure` to type your access and secret aws keys"
