From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:25:53 +0000
Subject: [PATCH 2/7] VMCI: Improve a size determination in two functions
Message-Id: <05412529-d0e2-0894-6229-431caa48c498@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 17:47:40 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_context.c | 2 +-
 drivers/misc/vmw_vmci/vmci_host.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index c0ea68255340..c7085ff76327 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -618,7 +618,7 @@ int vmci_ctx_add_notification(u32 context_id, u32 remote_cid)
 		goto out;
 	}
 
-	notifier = kmalloc(sizeof(struct vmci_handle_list), GFP_KERNEL);
+	notifier = kmalloc(sizeof(*notifier), GFP_KERNEL);
 	if (!notifier) {
 		result = VMCI_ERROR_NO_MEM;
 		goto out;
diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 4246a033de18..14da8210fd34 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -124,7 +124,7 @@ static int vmci_host_open(struct inode *inode, struct file *filp)
 {
 	struct vmci_host_dev *vmci_host_dev;
 
-	vmci_host_dev = kzalloc(sizeof(struct vmci_host_dev), GFP_KERNEL);
+	vmci_host_dev = kzalloc(sizeof(*vmci_host_dev), GFP_KERNEL);
 	if (vmci_host_dev = NULL)
 		return -ENOMEM;
 
-- 
2.15.1

