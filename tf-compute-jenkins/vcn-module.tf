module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.5.4"
  # insert the 1 required variable here


  # Required Inputs
  compartment_id = var.compartment_ocid

  # Optional Inputs
  region = "us-ashburn-1"

  # Optional Inputs
  vcn_name = "test-vcn-module"
  vcn_dns_label = "testvcnmodule"
  vcn_cidrs = ["10.0.0.0/16"]
  
  create_internet_gateway = true
  create_nat_gateway = true
  create_service_gateway = true  

}  
