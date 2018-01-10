From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:24:47 +0000
Subject: [PATCH 1/7] VMCI: Delete error messages for a failed memory allocation in seven functions
Message-Id: <543367a3-e6ca-6afa-63f7-90b5cca23e54@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 17:33:39 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_context.c  |  2 --
 drivers/misc/vmw_vmci/vmci_datagram.c |  4 +---
 drivers/misc/vmw_vmci/vmci_doorbell.c |  4 +---
 drivers/misc/vmw_vmci/vmci_guest.c    | 14 +++-----------
 drivers/misc/vmw_vmci/vmci_host.c     |  6 +-----
 5 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index 21d0fa592145..c0ea68255340 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -111,7 +111,6 @@ struct vmci_ctx *vmci_ctx_create(u32 cid, u32 priv_flags,
 
 	context = kzalloc(sizeof(*context), GFP_KERNEL);
 	if (!context) {
-		pr_warn("Failed to allocate memory for VMCI context\n");
 		error = -EINVAL;
 		goto err_out;
 	}
@@ -318,7 +317,6 @@ int vmci_ctx_enqueue_datagram(u32 cid, struct vmci_datagram *dg)
 	/* Allocate guest call entry and add it to the target VM's queue. */
 	dq_entry = kmalloc(sizeof(*dq_entry), GFP_KERNEL);
 	if (dq_entry = NULL) {
-		pr_warn("Failed to allocate memory for datagram\n");
 		vmci_ctx_put(context);
 		return VMCI_ERROR_NO_MEM;
 	}
diff --git a/drivers/misc/vmw_vmci/vmci_datagram.c b/drivers/misc/vmw_vmci/vmci_datagram.c
index 8a4b6bbe1bee..fbe145e2d125 100644
--- a/drivers/misc/vmw_vmci/vmci_datagram.c
+++ b/drivers/misc/vmw_vmci/vmci_datagram.c
@@ -80,10 +80,8 @@ static int dg_create_handle(u32 resource_id,
 	handle = vmci_make_handle(context_id, resource_id);
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (!entry) {
-		pr_warn("Failed allocating memory for datagram entry\n");
+	if (!entry)
 		return VMCI_ERROR_NO_MEM;
-	}
 
 	entry->run_delayed = (flags & VMCI_FLAG_DG_DELAYED_CB) ? true : false;
 	entry->flags = flags;
diff --git a/drivers/misc/vmw_vmci/vmci_doorbell.c b/drivers/misc/vmw_vmci/vmci_doorbell.c
index b3fa738ae005..46607ffc94db 100644
--- a/drivers/misc/vmw_vmci/vmci_doorbell.c
+++ b/drivers/misc/vmw_vmci/vmci_doorbell.c
@@ -423,10 +423,8 @@ int vmci_doorbell_create(struct vmci_handle *handle,
 		return VMCI_ERROR_INVALID_ARGS;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (entry = NULL) {
-		pr_warn("Failed allocating memory for datagram entry\n");
+	if (!entry)
 		return VMCI_ERROR_NO_MEM;
-	}
 
 	if (vmci_handle_is_invalid(*handle)) {
 		u32 context_id = vmci_get_context_id();
diff --git a/drivers/misc/vmw_vmci/vmci_guest.c b/drivers/misc/vmw_vmci/vmci_guest.c
index dad5abee656e..ba18e727c401 100644
--- a/drivers/misc/vmw_vmci/vmci_guest.c
+++ b/drivers/misc/vmw_vmci/vmci_guest.c
@@ -170,10 +170,8 @@ static int vmci_check_host_caps(struct pci_dev *pdev)
 	struct vmci_datagram *check_msg;
 
 	check_msg = kmalloc(msg_size, GFP_KERNEL);
-	if (!check_msg) {
-		dev_err(&pdev->dev, "%s: Insufficient memory\n", __func__);
+	if (!check_msg)
 		return -ENOMEM;
-	}
 
 	check_msg->dst = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
 					  VMCI_RESOURCES_QUERY);
@@ -457,11 +455,8 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 		 (unsigned long)iobase, pdev->irq);
 
 	vmci_dev = devm_kzalloc(&pdev->dev, sizeof(*vmci_dev), GFP_KERNEL);
-	if (!vmci_dev) {
-		dev_err(&pdev->dev,
-			"Can't allocate memory for VMCI device\n");
+	if (!vmci_dev)
 		return -ENOMEM;
-	}
 
 	vmci_dev->dev = &pdev->dev;
 	vmci_dev->exclusive_vectors = false;
@@ -473,11 +468,8 @@ static int vmci_guest_probe_device(struct pci_dev *pdev,
 		     vmci_process_bitmap, (unsigned long)vmci_dev);
 
 	vmci_dev->data_buffer = vmalloc(VMCI_MAX_DG_SIZE);
-	if (!vmci_dev->data_buffer) {
-		dev_err(&pdev->dev,
-			"Can't allocate memory for datagram buffer\n");
+	if (!vmci_dev->data_buffer)
 		return -ENOMEM;
-	}
 
 	pci_set_master(pdev);	/* To enable queue_pair functionality. */
 
diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 6640e7651533..4246a033de18 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -755,12 +755,8 @@ static int vmci_host_do_ctx_set_cpt_state(struct vmci_host_dev *vmci_host_dev,
 		return -EFAULT;
 
 	cpt_buf = kmalloc(set_info.buf_size, GFP_KERNEL);
-	if (!cpt_buf) {
-		vmci_ioctl_err(
-			"cannot allocate memory to set cpt state (type=%d)\n",
-			set_info.cpt_type);
+	if (!cpt_buf)
 		return -ENOMEM;
-	}
 
 	if (copy_from_user(cpt_buf, (void __user *)(uintptr_t)set_info.cpt_buf,
 			   set_info.buf_size)) {
-- 
2.15.1

