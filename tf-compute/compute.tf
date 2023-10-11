resource "oci_core_instance" "ubuntu_instance" {
  # Required
  availability_domain = "tkEg:US-ASHBURN-AD-1"
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaaxtkhmmkjv5btsnykvpopkt5lbfjbpgtyfqbtrgz3hb6237xeekna"
  shape               = "VM.Standard2.1"
  source_details {
    source_id   = "ocid1.image.oc1.iad.aaaaaaaaxdnjyq2drtrl5njggtas25gspssotsdzpa55cdpxwafda7essgna"
    source_type = "image"
  }

  # Optional
  display_name = "oci-tf-compute-instance"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = "ocid1.subnet.oc1.iad.aaaaaaaam7bwdkduy36ecqi7asopkaqem5nc7gg5eauayuiy6uvcsn7cq26a"
  }
  metadata = {
    ssh_authorized_keys = file("/home/opc/.ssh/oci-tf-compute-instance.pub")
  }
  preserve_boot_volume = false
}
