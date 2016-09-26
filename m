From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:43:04 +0000
Subject: [PATCH 05/11 V2 RESEND] staging: dgnc: move functions unrelated with dgnc_found_board()
Message-Id: <20160926004304.GA3846@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The functions related with tty device initialization are needed
to be moved from dgnc_found_board() to dgnc_init_one().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

V2: The subject line was cut off, I put it completely and update
change log.

 drivers/staging/dgnc/dgnc_driver.c | 81 ++++++++++++++++++++------------------
 1 file changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 0114e78..a95d13c 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -38,7 +38,7 @@ MODULE_SUPPORTED_DEVICE("dgnc");
  */
 static int		dgnc_start(void);
 static int		dgnc_finalize_board_init(struct dgnc_board *brd);
-static int		dgnc_found_board(struct pci_dev *pdev, int id);
+static struct dgnc_board *dgnc_found_board(struct pci_dev *pdev, int id);
 static void		dgnc_cleanup_board(struct dgnc_board *brd);
 static void		dgnc_poll_handler(ulong dummy);
 static int		dgnc_init_one(struct pci_dev *pdev,
@@ -274,6 +274,7 @@ failed_class:
 static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	int rc;
+	struct dgnc_board *brd;
 
 	/* wake up and enable device */
 	rc = pci_enable_device(pdev);
@@ -281,9 +282,43 @@ static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (rc)
 		return -EIO;
 
-	rc = dgnc_found_board(pdev, ent->driver_data);
-	if (rc = 0)
-		dgnc_num_boards++;
+	brd = dgnc_found_board(pdev, ent->driver_data);
+	if (IS_ERR(brd))
+		return PTR_ERR(brd);
+
+	/*
+	 * Do tty device initialization.
+	 */
+
+	rc = dgnc_tty_register(brd);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't register tty devices (%d)\n", rc);
+		goto failed;
+	}
+
+	rc = dgnc_finalize_board_init(brd);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
+		goto failed;
+	}
+
+	rc = dgnc_tty_init(brd);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
+		goto failed;
+	}
+
+	brd->state = BOARD_READY;
+	brd->dpastatus = BD_RUNNING;
+
+	dgnc_create_ports_sysfiles(brd);
+
+	dgnc_board[dgnc_num_boards++] = brd;
+
+	return 0;
+
+failed:
+	kfree(brd);
 
 	return rc;
 }
@@ -345,7 +380,7 @@ static void dgnc_cleanup_board(struct dgnc_board *brd)
  *
  * A board has been found, init it.
  */
-static int dgnc_found_board(struct pci_dev *pdev, int id)
+static struct dgnc_board *dgnc_found_board(struct pci_dev *pdev, int id)
 {
 	struct dgnc_board *brd;
 	unsigned int pci_irq;
@@ -355,7 +390,7 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 	/* get the board structure and prep it */
 	brd = kzalloc(sizeof(*brd), GFP_KERNEL);
 	if (!brd)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* store the info for the board we've found */
 	brd->magic = DGNC_BOARD_MAGIC;
@@ -505,33 +540,6 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 		goto failed;
 	}
 
-	/*
-	 * Do tty device initialization.
-	 */
-
-	rc = dgnc_tty_register(brd);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't register tty devices (%d)\n", rc);
-		goto failed;
-	}
-
-	rc = dgnc_finalize_board_init(brd);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
-		goto failed;
-	}
-
-	rc = dgnc_tty_init(brd);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
-		goto failed;
-	}
-
-	brd->state = BOARD_READY;
-	brd->dpastatus = BD_RUNNING;
-
-	dgnc_create_ports_sysfiles(brd);
-
 	/* init our poll helper tasklet */
 	tasklet_init(&brd->helper_tasklet,
 		     brd->bd_ops->tasklet,
@@ -539,15 +547,12 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	wake_up_interruptible(&brd->state_wait);
 
-	dgnc_board[dgnc_num_boards] = brd;
-
-	return 0;
+	return brd;
 
 failed:
-	dgnc_tty_uninit(brd);
 	kfree(brd);
 
-	return rc;
+	return ERR_PTR(rc);
 }
 
 static int dgnc_finalize_board_init(struct dgnc_board *brd)
-- 
1.9.1

