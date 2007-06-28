From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 16:39:43 +0000
Subject: [KJ] [PATCH] infiniband: Remove unnecessary cast of return value of
Message-Id: <468431A7020000F40000A99F@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc() in
infiniband/hw/cxgb3/iwch_provider.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/drivers/infiniband/hw/cxgb3/iwch_provider.c b/drivers/infiniband/hw/cxgb3/iwch_provider.c
index e7c2c39..0900561 100644
--- a/drivers/infiniband/hw/cxgb3/iwch_provider.c
+++ b/drivers/infiniband/hw/cxgb3/iwch_provider.c
@@ -1163,9 +1163,7 @@ int iwch_register_device(struct iwch_dev *dev)
 	dev->ibdev.post_recv = iwch_post_receive;
 
 
-	dev->ibdev.iwcm -	    (struct iw_cm_verbs *) kmalloc(sizeof(struct iw_cm_verbs),
-					   GFP_KERNEL);
+	dev->ibdev.iwcm = kmalloc(sizeof(struct iw_cm_verbs), GFP_KERNEL);
 	dev->ibdev.iwcm->connect = iwch_connect;
 	dev->ibdev.iwcm->accept = iwch_accept_cr;
 	dev->ibdev.iwcm->reject = iwch_reject_cr;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
