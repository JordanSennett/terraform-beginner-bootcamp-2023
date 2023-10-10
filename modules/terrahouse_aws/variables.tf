variable "user_uuid" {
  description = "User UUID"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "Invalid user UUID format. It should be in the form of a UUID (e.g., 123e4567-e89b-12d3-a456-426655440000)."
  }
}

variable "bucket_name" {
  description = "The name of the AWS S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]{3,63}$", var.bucket_name))
    error_message = "The bucket name must be between 3 and 63 characters long and can only contain letters, numbers, hyphens, and periods."
  }
}

variable "index_html_filepath" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition = fileexists(var.index_html_filepath)
    error_message = "The specified index.html file path does not exist."
  }
}

variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string

  validation {
    condition = fileexists(var.error_html_filepath)
    error_message = "The specified error.html file path does not exist."
  }
}