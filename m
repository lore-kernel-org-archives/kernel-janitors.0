From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2013 19:32:07 +0000
Subject: re: VMCI: guest side driver implementation.
Message-Id: <20130110193207.GA17997@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello George Zhang,

The patch 1f166439917b: "VMCI: guest side driver implementation." 
from Jan 8, 2013, leads to the following warning:
drivers/misc/vmw_vmci/vmci_guest.c:89 vmci_get_vm_context_id()
	 warn: always true condition '(result >= 0) => (0-u32max >= 0)'

drivers/misc/vmw_vmci/vmci_guest.c
    78  u32 vmci_get_vm_context_id(void)
    79  {
    80          if (vm_context_id = VMCI_INVALID_ID) {
    81                  u32 result;
    82                  struct vmci_datagram get_cid_msg;
    83                  get_cid_msg.dst     84                      vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
    85                                       VMCI_GET_CONTEXT_ID);
    86                  get_cid_msg.src = VMCI_ANON_SRC_HANDLE;
    87                  get_cid_msg.payload_size = 0;
    88                  result = vmci_send_datagram(&get_cid_msg);
    89                  if (result >= 0)
                            ^^^^^^^^^^^
Always true because result is an unsigned int.

    90                          vm_context_id = result;

regards,
dan carpenter

