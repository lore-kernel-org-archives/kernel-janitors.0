From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 19:21:06 +0000
Subject: [PATCH] VMCI: Use memdup_user() rather than duplicating its implementation
Message-Id: <77db177a-1062-3f46-738b-45c0a245153e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 21:12:41 +0200

Reuse existing functionality from memdup_user() instead of keeping
duplicate source code.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_host.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 9ec262a..0a20475 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -759,27 +759,16 @@ static int vmci_host_do_ctx_set_cpt_state(struct vmci_host_dev *vmci_host_dev,
 	if (copy_from_user(&set_info, uptr, sizeof(set_info)))
 		return -EFAULT;
 
-	cpt_buf = kmalloc(set_info.buf_size, GFP_KERNEL);
-	if (!cpt_buf) {
-		vmci_ioctl_err(
-			"cannot allocate memory to set cpt state (type=%d)\n",
-			set_info.cpt_type);
-		return -ENOMEM;
-	}
-
-	if (copy_from_user(cpt_buf, (void __user *)(uintptr_t)set_info.cpt_buf,
-			   set_info.buf_size)) {
-		retval = -EFAULT;
-		goto out;
-	}
+	cpt_buf = memdup_user((void __user *)(uintptr_t)set_info.cpt_buf,
+			      set_info.buf_size);
+	if (IS_ERR(cpt_buf))
+		return PTR_ERR(cpt_buf);
 
 	cid = vmci_ctx_get_id(vmci_host_dev->context);
 	set_info.result = vmci_ctx_set_chkpt_state(cid, set_info.cpt_type,
 						   set_info.buf_size, cpt_buf);
 
 	retval = copy_to_user(uptr, &set_info, sizeof(set_info)) ? -EFAULT : 0;
-
-out:
 	kfree(cpt_buf);
 	return retval;
 }
-- 
2.9.3

