From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Mar 2018 16:21:52 +0000
Subject: [PATCH 2/2] VMCI: Improve a size determination in two functions
Message-Id: <06589ca3-cab3-a71e-fbd2-cecf473ab9ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66411a1a-fd12-dc31-fc2e-800ff6cea1ed@users.sourceforge.net>
In-Reply-To: <66411a1a-fd12-dc31-fc2e-800ff6cea1ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, George Zhang <georgezhang@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Mar 2018 17:00:19 +0100

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
index 21d0fa592145..18404318dd71 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -620,7 +620,7 @@ int vmci_ctx_add_notification(u32 context_id, u32 remote_cid)
 		goto out;
 	}
 
-	notifier = kmalloc(sizeof(struct vmci_handle_list), GFP_KERNEL);
+	notifier = kmalloc(sizeof(*notifier), GFP_KERNEL);
 	if (!notifier) {
 		result = VMCI_ERROR_NO_MEM;
 		goto out;
diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index fb3d92a21afa..12419f97681d 100644
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
2.16.2

