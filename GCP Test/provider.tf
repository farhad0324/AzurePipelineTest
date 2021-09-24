// Configure the Google Cloud provider
provider "google" {
 credentials = file("CREDENTIALS_FILE.json")
 project     = "apigee-test-327012"
 region      = "us-west1"
}
