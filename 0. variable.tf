variable "amazon_linux" {
  	default = "ami-0e8e39877665a7c92" # 본인이 속한 리전의 Amazon Linux 2 AMI ID를 입력합니다
}

variable "user*_keyname" {
  	default = "user*-key"
}

variable "alb_account_id" {  
	default = "114774131450" # 본인이 속한 리전의 Elastic Load Balancing account ID를 입력합니다
}
