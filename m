From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:30:15 +0000
Subject: [PATCH 2/7] rapidio: Adjust 12 checks for null pointers
Message-Id: <739f9f1c-3ebe-c21b-c5e2-31976cfbc0ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 15:27:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 032ede23a8cb..f89085564c2c 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -243,7 +243,7 @@ int rio_request_inb_mbox(struct rio_mport *mport,
 	int rc = -ENOSYS;
 	struct resource *res;
 
-	if (mport->ops->open_inb_mbox = NULL)
+	if (!mport->ops->open_inb_mbox)
 		goto out;
 
 	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
@@ -326,7 +326,7 @@ int rio_request_outb_mbox(struct rio_mport *mport,
 	int rc = -ENOSYS;
 	struct resource *res;
 
-	if (mport->ops->open_outb_mbox = NULL)
+	if (!mport->ops->open_outb_mbox)
 		goto out;
 
 	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
@@ -632,7 +632,7 @@ int rio_request_inb_pwrite(struct rio_dev *rdev,
 	int rc = 0;
 
 	spin_lock(&rio_global_list_lock);
-	if (rdev->pwcback != NULL)
+	if (rdev->pwcback)
 		rc = -ENOMEM;
 	else
 		rdev->pwcback = pwcback;
@@ -975,7 +975,7 @@ rio_chk_dev_route(struct rio_dev *rdev, struct rio_dev **nrdev, int *npnum)
 		rdev = rdev->prev;
 	}
 
-	if (prev = NULL)
+	if (!prev)
 		goto err_out;
 
 	p_port = prev->rswitch->route_table[rdev->destid];
@@ -1054,7 +1054,7 @@ rio_get_input_status(struct rio_dev *rdev, int pnum, u32 *lnkresp)
 		RIO_MNT_REQ_CMD_IS);
 
 	/* Exit if the response is not expected */
-	if (lnkresp = NULL)
+	if (!lnkresp)
 		return 0;
 
 	checkcount = 3;
@@ -1696,7 +1696,7 @@ int rio_route_add_entry(struct rio_dev *rdev,
 
 	spin_lock(&rdev->rswitch->lock);
 
-	if (ops = NULL || ops->add_entry = NULL) {
+	if (!ops || !ops->add_entry) {
 		rc = rio_std_route_add_entry(rdev->net->hport, rdev->destid,
 					     rdev->hopcount, table,
 					     route_destid, route_port);
@@ -1749,7 +1749,7 @@ int rio_route_get_entry(struct rio_dev *rdev, u16 table,
 
 	spin_lock(&rdev->rswitch->lock);
 
-	if (ops = NULL || ops->get_entry = NULL) {
+	if (!ops || !ops->get_entry) {
 		rc = rio_std_route_get_entry(rdev->net->hport, rdev->destid,
 					     rdev->hopcount, table,
 					     route_destid, route_port);
@@ -1797,7 +1797,7 @@ int rio_route_clr_table(struct rio_dev *rdev, u16 table, int lock)
 
 	spin_lock(&rdev->rswitch->lock);
 
-	if (ops = NULL || ops->clr_table = NULL) {
+	if (!ops || !ops->clr_table) {
 		rc = rio_std_route_clr_table(rdev->net->hport, rdev->destid,
 					     rdev->hopcount, table);
 	} else if (try_module_get(ops->owner)) {
@@ -1889,7 +1889,7 @@ struct dma_async_tx_descriptor *rio_dma_prep_xfer(struct dma_chan *dchan,
 {
 	struct rio_dma_ext rio_ext;
 
-	if (dchan->device->device_prep_slave_sg = NULL) {
+	if (!dchan->device->device_prep_slave_sg) {
 		pr_err("%s: prep_rio_sg = NULL\n", __func__);
 		return NULL;
 	}
-- 
2.15.1

