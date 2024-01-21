# no -auto-approve in case of accidental destruction :)

cd infrastructure/
terraform destroy -lock=false
wait $!

cd remote_state/
terraform destroy -lock=false
wait $!