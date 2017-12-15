From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:31:36 +0000
Subject: [PATCH 3/7] rapidio: Adjust five function calls together with a variable assignment
Message-Id: <6f5631ed-ec3e-503d-850a-ab09b5736dbe@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 16:07:07 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index f89085564c2c..b9dc932ce19e 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -252,9 +252,9 @@ int rio_request_inb_mbox(struct rio_mport *mport,
 		rio_init_mbox_res(res, mbox, mbox);
 
 		/* Make sure this mailbox isn't in use */
-		if ((rc -		     request_resource(&mport->riores[RIO_INB_MBOX_RESOURCE],
-				      res)) < 0) {
+		rc = request_resource(&mport->riores[RIO_INB_MBOX_RESOURCE],
+				      res);
+		if (rc < 0) {
 			kfree(res);
 			goto out;
 		}
@@ -335,9 +335,9 @@ int rio_request_outb_mbox(struct rio_mport *mport,
 		rio_init_mbox_res(res, mbox, mbox);
 
 		/* Make sure this outbound mailbox isn't in use */
-		if ((rc -		     request_resource(&mport->riores[RIO_OUTB_MBOX_RESOURCE],
-				      res)) < 0) {
+		rc = request_resource(&mport->riores[RIO_OUTB_MBOX_RESOURCE],
+				      res);
+		if (rc < 0) {
 			kfree(res);
 			goto out;
 		}
@@ -406,9 +406,9 @@ rio_setup_inb_dbell(struct rio_mport *mport, void *dev_id, struct resource *res,
 				  u16 info))
 {
 	int rc = 0;
-	struct rio_dbell *dbell;
+	struct rio_dbell *dbell = kmalloc(sizeof(*dbell), GFP_KERNEL);
 
-	if (!(dbell = kmalloc(sizeof(struct rio_dbell), GFP_KERNEL))) {
+	if (!dbell) {
 		rc = -ENOMEM;
 		goto out;
 	}
@@ -452,9 +452,9 @@ int rio_request_inb_dbell(struct rio_mport *mport,
 		rio_init_dbell_res(res, start, end);
 
 		/* Make sure these doorbells aren't in use */
-		if ((rc -		     request_resource(&mport->riores[RIO_DOORBELL_RESOURCE],
-				      res)) < 0) {
+		rc = request_resource(&mport->riores[RIO_DOORBELL_RESOURCE],
+				      res);
+		if (rc < 0) {
 			kfree(res);
 			goto out;
 		}
@@ -1411,7 +1411,9 @@ rio_mport_get_feature(struct rio_mport * port, int local, u16 destid,
 						 ext_ftr_ptr, &ftr_header);
 		if (RIO_GET_BLOCK_ID(ftr_header) = ftr)
 			return ext_ftr_ptr;
-		if (!(ext_ftr_ptr = RIO_GET_BLOCK_PTR(ftr_header)))
+
+		ext_ftr_ptr = RIO_GET_BLOCK_PTR(ftr_header);
+		if (!ext_ftr_ptr)
 			break;
 	}
 
-- 
2.15.1

