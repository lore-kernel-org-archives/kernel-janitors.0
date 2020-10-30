From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Oct 2020 11:30:33 +0000
Subject: [bug report] nitro_enclaves: Add logic for setting an enclave vCPU
Message-Id: <20201030113033.GA3251003@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Andra Paraschiv,

The patch ff8a4d3e3a99: "nitro_enclaves: Add logic for setting an
enclave vCPU" from Sep 21, 2020, leads to the following static
checker warning:

	drivers/virt/nitro_enclaves/ne_misc_dev.c:471 ne_donated_cpu()
	error: passing untrusted data 'cpu' to 'cpumask_test_cpu()'

drivers/virt/nitro_enclaves/ne_misc_dev.c
  1093          switch (cmd) {
  1094          case NE_ADD_VCPU: {
  1095                  int rc = -EINVAL;
  1096                  u32 vcpu_id = 0;
  1097  
  1098                  if (copy_from_user(&vcpu_id, (void __user *)arg, sizeof(vcpu_id)))
                                           ^^^^^^^^

  1099                          return -EFAULT;
  1100  
  1101                  mutex_lock(&ne_enclave->enclave_info_mutex);
  1102  
  1103                  if (ne_enclave->state != NE_STATE_INIT) {
  1104                          dev_err_ratelimited(ne_misc_dev.this_device,
  1105                                              "Enclave is not in init state\n");
  1106  
  1107                          mutex_unlock(&ne_enclave->enclave_info_mutex);
  1108  
  1109                          return -NE_ERR_NOT_IN_INIT_STATE;
  1110                  }
  1111  
  1112                  if (vcpu_id >= (ne_enclave->nr_parent_vm_cores *
  1113                      ne_enclave->nr_threads_per_core)) {

To prevent a buffer overflow vcpu_id has to be less than "nr_cpu_ids".
Is "ne_enclave->nr_parent_vm_cores * ne_enclave->nr_threads_per_core"
<= nr_cpu_ids?  If so then it's fine.

  1114                          dev_err_ratelimited(ne_misc_dev.this_device,
  1115                                              "vCPU id higher than max CPU id\n");
  1116  
  1117                          mutex_unlock(&ne_enclave->enclave_info_mutex);
  1118  
  1119                          return -NE_ERR_INVALID_VCPU;
  1120                  }
  1121  
  1122                  if (!vcpu_id) {
  1123                          /* Use the CPU pool for choosing a CPU for the enclave. */
  1124                          rc = ne_get_cpu_from_cpu_pool(ne_enclave, &vcpu_id);
  1125                          if (rc < 0) {
  1126                                  dev_err_ratelimited(ne_misc_dev.this_device,
  1127                                                      "Error in get CPU from pool [rc=%d]\n",
  1128                                                      rc);
  1129  
  1130                                  mutex_unlock(&ne_enclave->enclave_info_mutex);
  1131  
  1132                                  return rc;
  1133                          }
  1134                  } else {
  1135                          /* Check if the provided vCPU is available in the NE CPU pool. */
  1136                          rc = ne_check_cpu_in_cpu_pool(ne_enclave, vcpu_id);
                                                                          ^^^^^^^
This will lead to the out of bounds if vcpu_id is more than
nr_cpu_ids.

  1137                          if (rc < 0) {
  1138                                  dev_err_ratelimited(ne_misc_dev.this_device,

regards,
dan carpenter
