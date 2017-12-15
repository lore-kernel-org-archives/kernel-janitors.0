From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:35:16 +0000
Subject: [PATCH 6/7] rapidio: Return an error code only as a constant in two functions
Message-Id: <8db441e1-c227-64e7-4747-095da63d7a2e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:40:19 +0100

* Return an error code without storing it in an intermediate variable.

* Delete the label "out" and local variable "rc" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 4604410fb001..d095a18257c2 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -402,13 +402,10 @@ rio_setup_inb_dbell(struct rio_mport *mport, void *dev_id, struct resource *res,
 		    void (*dinb) (struct rio_mport * mport, void *dev_id, u16 src, u16 dst,
 				  u16 info))
 {
-	int rc = 0;
 	struct rio_dbell *dbell = kmalloc(sizeof(*dbell), GFP_KERNEL);
 
-	if (!dbell) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!dbell)
+		return -ENOMEM;
 
 	dbell->res = res;
 	dbell->dinb = dinb;
@@ -417,9 +414,7 @@ rio_setup_inb_dbell(struct rio_mport *mport, void *dev_id, struct resource *res,
 	mutex_lock(&mport->lock);
 	list_add_tail(&dbell->node, &mport->dbells);
 	mutex_unlock(&mport->lock);
-
-      out:
-	return rc;
+	return 0;
 }
 
 /**
@@ -563,21 +558,17 @@ int rio_add_mport_pw_handler(struct rio_mport *mport, void *context,
 			     int (*pwcback)(struct rio_mport *mport,
 			     void *context, union rio_pw_msg *msg, int step))
 {
-	int rc = 0;
 	struct rio_pwrite *pwrite = kzalloc(sizeof(*pwrite), GFP_KERNEL);
 
-	if (!pwrite) {
-		rc = -ENOMEM;
-		goto out;
-	}
+	if (!pwrite)
+		return -ENOMEM;
 
 	pwrite->pwcback = pwcback;
 	pwrite->context = context;
 	mutex_lock(&mport->lock);
 	list_add_tail(&pwrite->node, &mport->pwrites);
 	mutex_unlock(&mport->lock);
-out:
-	return rc;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rio_add_mport_pw_handler);
 
-- 
2.15.1

