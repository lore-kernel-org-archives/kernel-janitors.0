From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 12:12:31 +0000
Subject: [patch] IB/qib: cleanup qib_register_observer()
Message-Id: <20140130121231.GA17753@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marciniszyn <infinipath@intel.com>
Cc: Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

Returning directly is easier to read than do-nothing gotos.  Remove the
duplicative check on "olp" and pulled the code in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/qib/qib_diag.c b/drivers/infiniband/hw/qib/qib_diag.c
index 1686fd4bda87..52601ae4b327 100644
--- a/drivers/infiniband/hw/qib/qib_diag.c
+++ b/drivers/infiniband/hw/qib/qib_diag.c
@@ -689,28 +689,23 @@ int qib_register_observer(struct qib_devdata *dd,
 			  const struct diag_observer *op)
 {
 	struct diag_observer_list_elt *olp;
-	int ret = -EINVAL;
+	unsigned long flags;
 
 	if (!dd || !op)
-		goto bail;
-	ret = -ENOMEM;
+		return -EINVAL;
 	olp = vmalloc(sizeof *olp);
 	if (!olp) {
 		pr_err("vmalloc for observer failed\n");
-		goto bail;
+		return -ENOMEM;
 	}
-	if (olp) {
-		unsigned long flags;
 
-		spin_lock_irqsave(&dd->qib_diag_trans_lock, flags);
-		olp->op = op;
-		olp->next = dd->diag_observer_list;
-		dd->diag_observer_list = olp;
-		spin_unlock_irqrestore(&dd->qib_diag_trans_lock, flags);
-		ret = 0;
-	}
-bail:
-	return ret;
+	spin_lock_irqsave(&dd->qib_diag_trans_lock, flags);
+	olp->op = op;
+	olp->next = dd->diag_observer_list;
+	dd->diag_observer_list = olp;
+	spin_unlock_irqrestore(&dd->qib_diag_trans_lock, flags);
+
+	return 0;
 }
 
 /* Remove all registered observers when device is closed */
