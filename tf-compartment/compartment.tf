resource "oci_identity_compartment" "tf-compartment" {
  # Required
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaaunprf4yuhio6wulnx5tfb7do6hff3ztmbru6jws2tp7bf4deajgq"
  description    = "Compartment for Terraform resources."
  name           = "test-compartment"
}
