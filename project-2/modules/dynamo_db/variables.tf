variable "dynamodb_table_name" {
    description = " name of the dynamo "
    type = string
}

variable "hash_key" {
    description = " hash-key "
    type = string
}

variable "billing_mode" {
    description = " type of the billing "
    type = string
}

variable "hash_key_type" {
    description = " type of hash key "
    type = string
}