From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Mar 2018 16:20:47 +0000
Subject: [PATCH 1/2] VMCI: Use memdup_user() rather than duplicating its implementation
Message-Id: <7c97d2aa-7d3e-468f-cdb7-795a50d437c3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66411a1a-fd12-dc31-fc2e-800ff6cea1ed@users.sourceforge.net>
In-Reply-To: <66411a1a-fd12-dc31-fc2e-800ff6cea1ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, George Zhang <georgezhang@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Mar 2018 16:40:29 +0100

* Reuse existing functionality from memdup_user() instead of keeping
  duplicate source code.

  This issue was detected by using the Coccinelle software.

* Return directly after this function call failed at the beginning.

* Delete the label "out" which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_host.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index 83e0c95d20a4..fb3d92a21afa 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -754,27 +754,16 @@ static int vmci_host_do_ctx_set_cpt_state(struct vmci_host_dev *vmci_host_dev,
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
2.16.2

