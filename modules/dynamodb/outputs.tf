output "table_arn" {
  value = aws_dynamodb_table.products_table.arn
}

output "table_name" {
  value = aws_dynamodb_table.products_table.name
}