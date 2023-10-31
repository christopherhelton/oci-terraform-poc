resource "oci_core_instance" "ubuntu_instance" {
  # Required
  availability_domain = "tkEg:US-ASHBURN-AD-1"
  compartment_id      = oci_identity_compartment.tf-compartment.id
  shape               = "VM.Standard2.1"
  source_details {
    source_id   = "ocid1.image.oc1.iad.aaaaaaaavbafqm6xn5bkhrqtohcdphv5b7c7wzile7w33cv4drdiittiivpa"
    source_type = "image"
  }

  # Optional
  display_name = "oci-tf-compute-instance"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.vcn-public-subnet.id
  }
  metadata = {
    ssh_authorized_keys = file("/home/opc/.ssh/oci-tf-compute-instance.pub")
    user_data = "${base64encode(file("./install_jenkins.sh"))}"
  }
  preserve_boot_volume = false
}
