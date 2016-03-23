From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 23 Mar 2016 05:13:59 +0000
Subject: [PATCH] staging: dgnc: fix CamelCase in dgnc_driver.c
Message-Id: <20160323051359.GA4812@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix checkpatch.pl warning about CamelCase.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 4eb410e..af2e835 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -48,7 +48,7 @@ static void		dgnc_do_remap(struct dgnc_board *brd);
 /*
  * File operations permitted on Control/Management major.
  */
-static const struct file_operations dgnc_BoardFops = {
+static const struct file_operations dgnc_board_fops = {
 	.owner		=	THIS_MODULE,
 	.unlocked_ioctl =	dgnc_mgmt_ioctl,
 	.open		=	dgnc_mgmt_open,
@@ -58,11 +58,11 @@ static const struct file_operations dgnc_BoardFops = {
 /*
  * Globals
  */
-uint			dgnc_NumBoards;
-struct dgnc_board		*dgnc_Board[MAXBOARDS];
+uint			dgnc_num_boards;
+struct dgnc_board		*dgnc_board[MAXBOARDS];
 DEFINE_SPINLOCK(dgnc_global_lock);
 DEFINE_SPINLOCK(dgnc_poll_lock); /* Poll scheduling lock */
-uint			dgnc_Major;
+uint			dgnc_major;
 int			dgnc_poll_tick = 20;	/* Poll interval - 20 ms */
 
 /*
@@ -92,7 +92,7 @@ struct board_id {
 	unsigned int is_pci_express;
 };
 
-static struct board_id dgnc_Ids[] = {
+static struct board_id dgnc_ids[] = {
 	{	PCI_DEVICE_CLASSIC_4_PCI_NAME,		4,	0	},
 	{	PCI_DEVICE_CLASSIC_4_422_PCI_NAME,	4,	0	},
 	{	PCI_DEVICE_CLASSIC_8_PCI_NAME,		8,	0	},
@@ -140,14 +140,14 @@ static void cleanup(bool sysfiles)
 	if (sysfiles)
 		dgnc_remove_driver_sysfiles(&dgnc_driver);
 
-	device_destroy(dgnc_class, MKDEV(dgnc_Major, 0));
+	device_destroy(dgnc_class, MKDEV(dgnc_major, 0));
 	class_destroy(dgnc_class);
-	unregister_chrdev(dgnc_Major, "dgnc");
+	unregister_chrdev(dgnc_major, "dgnc");
 
-	for (i = 0; i < dgnc_NumBoards; ++i) {
-		dgnc_remove_ports_sysfiles(dgnc_Board[i]);
-		dgnc_tty_uninit(dgnc_Board[i]);
-		dgnc_cleanup_board(dgnc_Board[i]);
+	for (i = 0; i < dgnc_num_boards; ++i) {
+		dgnc_remove_ports_sysfiles(dgnc_board[i]);
+		dgnc_tty_uninit(dgnc_board[i]);
+		dgnc_cleanup_board(dgnc_board[i]);
 	}
 
 	dgnc_tty_post_uninit();
@@ -217,12 +217,12 @@ static int dgnc_start(void)
 	 *
 	 * Register management/dpa devices
 	 */
-	rc = register_chrdev(0, "dgnc", &dgnc_BoardFops);
+	rc = register_chrdev(0, "dgnc", &dgnc_board_fops);
 	if (rc < 0) {
 		pr_err(DRVSTR ": Can't register dgnc driver device (%d)\n", rc);
 		return rc;
 	}
-	dgnc_Major = rc;
+	dgnc_major = rc;
 
 	dgnc_class = class_create(THIS_MODULE, "dgnc_mgmt");
 	if (IS_ERR(dgnc_class)) {
@@ -232,7 +232,7 @@ static int dgnc_start(void)
 	}
 
 	dev = device_create(dgnc_class, NULL,
-			    MKDEV(dgnc_Major, 0),
+			    MKDEV(dgnc_major, 0),
 			NULL, "dgnc_mgmt");
 	if (IS_ERR(dev)) {
 		rc = PTR_ERR(dev);
@@ -262,11 +262,11 @@ static int dgnc_start(void)
 	return 0;
 
 failed_tty:
-	device_destroy(dgnc_class, MKDEV(dgnc_Major, 0));
+	device_destroy(dgnc_class, MKDEV(dgnc_major, 0));
 failed_device:
 	class_destroy(dgnc_class);
 failed_class:
-	unregister_chrdev(dgnc_Major, "dgnc");
+	unregister_chrdev(dgnc_major, "dgnc");
 	return rc;
 }
 
@@ -283,7 +283,7 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	rc = dgnc_found_board(pdev, ent->driver_data);
 	if (rc = 0)
-		dgnc_NumBoards++;
+		dgnc_num_boards++;
 
 	return rc;
 }
@@ -346,7 +346,7 @@ static void dgnc_cleanup_board(struct dgnc_board *brd)
 		}
 	}
 
-	dgnc_Board[brd->boardnum] = NULL;
+	dgnc_board[brd->boardnum] = NULL;
 
 	kfree(brd);
 }
@@ -365,8 +365,8 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	unsigned long flags;
 
 	/* get the board structure and prep it */
-	dgnc_Board[dgnc_NumBoards] = kzalloc(sizeof(*brd), GFP_KERNEL);
-	brd = dgnc_Board[dgnc_NumBoards];
+	dgnc_board[dgnc_num_boards] = kzalloc(sizeof(*brd), GFP_KERNEL);
+	brd = dgnc_board[dgnc_num_boards];
 
 	if (!brd)
 		return -ENOMEM;
@@ -382,15 +382,15 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	/* store the info for the board we've found */
 	brd->magic = DGNC_BOARD_MAGIC;
-	brd->boardnum = dgnc_NumBoards;
+	brd->boardnum = dgnc_num_boards;
 	brd->vendor = dgnc_pci_tbl[id].vendor;
 	brd->device = dgnc_pci_tbl[id].device;
 	brd->pdev = pdev;
 	brd->pci_bus = pdev->bus->number;
 	brd->pci_slot = PCI_SLOT(pdev->devfn);
-	brd->name = dgnc_Ids[id].name;
-	brd->maxports = dgnc_Ids[id].maxports;
-	if (dgnc_Ids[i].is_pci_express)
+	brd->name = dgnc_ids[id].name;
+	brd->maxports = dgnc_ids[id].maxports;
+	if (dgnc_ids[i].is_pci_express)
 		brd->bd_flags |= BD_IS_PCI_EXPRESS;
 	brd->dpastatus = BD_NOFEP;
 	init_waitqueue_head(&brd->state_wait);
@@ -642,8 +642,8 @@ static void dgnc_poll_handler(ulong dummy)
 	unsigned long new_time;
 
 	/* Go thru each board, kicking off a tasklet for each if needed */
-	for (i = 0; i < dgnc_NumBoards; i++) {
-		brd = dgnc_Board[i];
+	for (i = 0; i < dgnc_num_boards; i++) {
+		brd = dgnc_board[i];
 
 		spin_lock_irqsave(&brd->bd_lock, flags);
 
-- 
1.9.1

