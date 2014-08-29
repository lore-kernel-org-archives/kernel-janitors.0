From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Aug 2014 08:42:56 +0000
Subject: [patch] VMCI: integer overflow in vmci_datagram_dispatch()
Message-Id: <20140829084256.GA14780@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, George Zhang <georgezhang@vmware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org

This is untrusted user data from vmci_host_do_send_datagram() so the
VMCI_DG_SIZE() macro can have an integer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
index f3cdd90..8226652 100644
--- a/drivers/misc/vmw_vmci/vmci_datagram.c
+++ b/drivers/misc/vmw_vmci/vmci_datagram.c
@@ -328,7 +328,8 @@ int vmci_datagram_dispatch(u32 context_id,
 
 	BUILD_BUG_ON(sizeof(struct vmci_datagram) != 24);
 
-	if (VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
+	if (dg->payload_size > VMCI_MAX_DG_SIZE ||
+	    VMCI_DG_SIZE(dg) > VMCI_MAX_DG_SIZE) {
 		pr_devel("Payload (size=%llu bytes) too big to send\n",
 			 (unsigned long long)dg->payload_size);
 		return VMCI_ERROR_INVALID_ARGS;
