resource "aws_key_pair" "user*_keyname" {
  key_name   = "user*-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbZjM3IU6KbzMVQsz1b04aWCGxONyoqkUiMrxt8VUG9by7RkNo17vanfwoumKC0stOrTGNJanWiel32aL1gQJ9oh/VqISJRpEjdOPx85eolo9Fud7fbrtAkEu7xYBN07fvqkbulnFLn7rtM5JWrHqkA6g0audvzKkBv39M3bZAywBFmddjQluqrsahx6yktotx95BxMMurBA4tiTBt1e/uj2SKj6Ku/eAXHLv9hWO2ovwt1mxNqeEhYZ2wSTgNQuRHqUYdD3t/aPROwQIL6i9GEko13Y5nMz58xjmujNgiWTnQDfE2/tX3BVspb5f+2lGYoBfI88NsHKmQ5YGRwK+7 ec2-user@ip-172-31-26-177.ap-northeast-2.compute.internal" #본인의 key 값을 넣어주세요
}
