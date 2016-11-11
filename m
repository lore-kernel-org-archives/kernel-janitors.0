From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 11 Nov 2016 07:55:44 +0000
Subject: [PATCH] staging: dgnc: re-arrange functions for removing forward declarations
Message-Id: <20161111075543.GA31592@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Re-arrange the functions for removing forward declarations in dgnc_driver.c

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
I've checked the object size of dgnc_driver.c before and after.
It has same size after re-arranging functions.

 drivers/staging/dgnc/dgnc_driver.c | 533 ++++++++++++++++++-------------------
 1 file changed, 261 insertions(+), 272 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index d3243a3..6f2bffa 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -31,21 +31,6 @@
 MODULE_DESCRIPTION("Driver for the Digi International Neo and Classic PCI based product line");
 MODULE_SUPPORTED_DEVICE("dgnc");
 
-/**************************************************************************
- *
- * protos for this file
- *
- */
-static int		dgnc_start(void);
-static int dgnc_request_irq(struct dgnc_board *brd);
-static void dgnc_free_irq(struct dgnc_board *brd);
-static struct dgnc_board *dgnc_found_board(struct pci_dev *pdev, int id);
-static void		dgnc_cleanup_board(struct dgnc_board *brd);
-static void		dgnc_poll_handler(ulong dummy);
-static int		dgnc_init_one(struct pci_dev *pdev,
-				      const struct pci_device_id *ent);
-static int		dgnc_do_remap(struct dgnc_board *brd);
-
 /*
  * File operations permitted on Control/Management major.
  */
@@ -114,261 +99,23 @@ struct board_id {
 	{	NULL,					0,	0	}
 };
 
-static struct pci_driver dgnc_driver = {
-	.name		= "dgnc",
-	.probe		= dgnc_init_one,
-	.id_table       = dgnc_pci_tbl,
-};
-
-/************************************************************************
- *
- * Driver load/unload functions
- *
- ************************************************************************/
-
-static void cleanup(bool sysfiles)
-{
-	int i;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dgnc_poll_lock, flags);
-	dgnc_poll_stop = 1;
-	spin_unlock_irqrestore(&dgnc_poll_lock, flags);
-
-	/* Turn off poller right away. */
-	del_timer_sync(&dgnc_poll_timer);
-
-	if (sysfiles)
-		dgnc_remove_driver_sysfiles(&dgnc_driver);
-
-	device_destroy(dgnc_class, MKDEV(dgnc_major, 0));
-	class_destroy(dgnc_class);
-	unregister_chrdev(dgnc_major, "dgnc");
-
-	for (i = 0; i < dgnc_num_boards; ++i) {
-		dgnc_remove_ports_sysfiles(dgnc_board[i]);
-		dgnc_cleanup_tty(dgnc_board[i]);
-		dgnc_cleanup_board(dgnc_board[i]);
-	}
-
-}
-
-/*
- * dgnc_cleanup_module()
- *
- * Module unload.  This is where it all ends.
- */
-static void __exit dgnc_cleanup_module(void)
-{
-	cleanup(true);
-	pci_unregister_driver(&dgnc_driver);
-}
-
-/*
- * init_module()
- *
- * Module load.  This is where it all starts.
- */
-static int __init dgnc_init_module(void)
-{
-	int rc;
-
-	/*
-	 * Initialize global stuff
-	 */
-	rc = dgnc_start();
-
-	if (rc < 0)
-		return rc;
-
-	/*
-	 * Find and configure all the cards
-	 */
-	rc = pci_register_driver(&dgnc_driver);
-	if (rc) {
-		pr_warn("WARNING: dgnc driver load failed.  No Digi Neo or Classic boards found.\n");
-		cleanup(false);
-		return rc;
-	}
-	dgnc_create_driver_sysfiles(&dgnc_driver);
-
-	return 0;
-}
 
-module_init(dgnc_init_module);
-module_exit(dgnc_cleanup_module);
 
 /*
- * Start of driver.
+ * Remap PCI memory.
  */
-static int dgnc_start(void)
+static int dgnc_do_remap(struct dgnc_board *brd)
 {
 	int rc = 0;
-	unsigned long flags;
-	struct device *dev;
-
-	/* make sure timer is initialized before we do anything else */
-	init_timer(&dgnc_poll_timer);
-
-	/*
-	 * Register our base character device into the kernel.
-	 * This allows the download daemon to connect to the downld device
-	 * before any of the boards are init'ed.
-	 *
-	 * Register management/dpa devices
-	 */
-	rc = register_chrdev(0, "dgnc", &dgnc_board_fops);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't register dgnc driver device (%d)\n", rc);
-		return rc;
-	}
-	dgnc_major = rc;
-
-	dgnc_class = class_create(THIS_MODULE, "dgnc_mgmt");
-	if (IS_ERR(dgnc_class)) {
-		rc = PTR_ERR(dgnc_class);
-		pr_err(DRVSTR ": Can't create dgnc_mgmt class (%d)\n", rc);
-		goto failed_class;
-	}
-
-	dev = device_create(dgnc_class, NULL,
-			    MKDEV(dgnc_major, 0),
-			NULL, "dgnc_mgmt");
-	if (IS_ERR(dev)) {
-		rc = PTR_ERR(dev);
-		pr_err(DRVSTR ": Can't create device (%d)\n", rc);
-		goto failed_device;
-	}
-
-	/* Start the poller */
-	spin_lock_irqsave(&dgnc_poll_lock, flags);
-	setup_timer(&dgnc_poll_timer, dgnc_poll_handler, 0);
-	dgnc_poll_time = jiffies + dgnc_jiffies_from_ms(dgnc_poll_tick);
-	dgnc_poll_timer.expires = dgnc_poll_time;
-	spin_unlock_irqrestore(&dgnc_poll_lock, flags);
-
-	add_timer(&dgnc_poll_timer);
-
-	return 0;
-
-failed_device:
-	class_destroy(dgnc_class);
-failed_class:
-	unregister_chrdev(dgnc_major, "dgnc");
-	return rc;
-}
-
-/* returns count (>= 0), or negative on error */
-static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
-{
-	int rc;
-	struct dgnc_board *brd;
-
-	/* wake up and enable device */
-	rc = pci_enable_device(pdev);
-
-	if (rc)
-		return -EIO;
-
-	brd = dgnc_found_board(pdev, ent->driver_data);
-	if (IS_ERR(brd))
-		return PTR_ERR(brd);
-
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
-	rc = dgnc_request_irq(brd);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
-		goto unregister_tty;
-	}
-
-	rc = dgnc_tty_init(brd);
-	if (rc < 0) {
-		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
-		goto free_irq;
-	}
-
-	brd->state = BOARD_READY;
-	brd->dpastatus = BD_RUNNING;
-
-	dgnc_create_ports_sysfiles(brd);
-
-	dgnc_board[dgnc_num_boards++] = brd;
-
-	return 0;
-
-free_irq:
-	dgnc_free_irq(brd);
-unregister_tty:
-	dgnc_tty_unregister(brd);
 
-failed:
-	kfree(brd);
+	brd->re_map_membase = ioremap(brd->membase, 0x1000);
+	if (!brd->re_map_membase)
+		rc = -ENOMEM;
 
 	return rc;
 }
 
 /*
- * dgnc_cleanup_board()
- *
- * Free all the memory associated with a board
- */
-static void dgnc_cleanup_board(struct dgnc_board *brd)
-{
-	int i = 0;
-
-	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
-		return;
-
-	switch (brd->device) {
-	case PCI_DEVICE_CLASSIC_4_DID:
-	case PCI_DEVICE_CLASSIC_8_DID:
-	case PCI_DEVICE_CLASSIC_4_422_DID:
-	case PCI_DEVICE_CLASSIC_8_422_DID:
-
-		/* Tell card not to interrupt anymore. */
-		outb(0, brd->iobase + 0x4c);
-		break;
-
-	default:
-		break;
-	}
-
-	if (brd->irq)
-		free_irq(brd->irq, brd);
-
-	tasklet_kill(&brd->helper_tasklet);
-
-	if (brd->re_map_membase) {
-		iounmap(brd->re_map_membase);
-		brd->re_map_membase = NULL;
-	}
-
-	/* Free all allocated channels structs */
-	for (i = 0; i < MAXPORTS ; i++) {
-		if (brd->channels[i]) {
-			kfree(brd->channels[i]->ch_rqueue);
-			kfree(brd->channels[i]->ch_equeue);
-			kfree(brd->channels[i]->ch_wqueue);
-			kfree(brd->channels[i]);
-			brd->channels[i] = NULL;
-		}
-	}
-
-	dgnc_board[brd->boardnum] = NULL;
-
-	kfree(brd);
-}
-
-/*
  * dgnc_found_board()
  *
  * A board has been found, init it.
@@ -574,20 +321,6 @@ static void dgnc_free_irq(struct dgnc_board *brd)
 }
 
 /*
- * Remap PCI memory.
- */
-static int dgnc_do_remap(struct dgnc_board *brd)
-{
-	int rc = 0;
-
-	brd->re_map_membase = ioremap(brd->membase, 0x1000);
-	if (!brd->re_map_membase)
-		rc = -ENOMEM;
-
-	return rc;
-}
-
-/*
  *
  * Function:
  *
@@ -656,3 +389,259 @@ static void dgnc_poll_handler(ulong dummy)
 	if (!dgnc_poll_stop)
 		add_timer(&dgnc_poll_timer);
 }
+
+/* returns count (>= 0), or negative on error */
+static int dgnc_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	int rc;
+	struct dgnc_board *brd;
+
+	/* wake up and enable device */
+	rc = pci_enable_device(pdev);
+
+	if (rc)
+		return -EIO;
+
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
+	rc = dgnc_request_irq(brd);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
+		goto unregister_tty;
+	}
+
+	rc = dgnc_tty_init(brd);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't init tty devices (%d)\n", rc);
+		goto free_irq;
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
+free_irq:
+	dgnc_free_irq(brd);
+unregister_tty:
+	dgnc_tty_unregister(brd);
+
+failed:
+	kfree(brd);
+
+	return rc;
+}
+
+static struct pci_driver dgnc_driver = {
+	.name		= "dgnc",
+	.probe		= dgnc_init_one,
+	.id_table       = dgnc_pci_tbl,
+};
+
+/*
+ * Start of driver.
+ */
+static int dgnc_start(void)
+{
+	int rc = 0;
+	unsigned long flags;
+	struct device *dev;
+
+	/* make sure timer is initialized before we do anything else */
+	init_timer(&dgnc_poll_timer);
+
+	/*
+	 * Register our base character device into the kernel.
+	 * This allows the download daemon to connect to the downld device
+	 * before any of the boards are init'ed.
+	 *
+	 * Register management/dpa devices
+	 */
+	rc = register_chrdev(0, "dgnc", &dgnc_board_fops);
+	if (rc < 0) {
+		pr_err(DRVSTR ": Can't register dgnc driver device (%d)\n", rc);
+		return rc;
+	}
+	dgnc_major = rc;
+
+	dgnc_class = class_create(THIS_MODULE, "dgnc_mgmt");
+	if (IS_ERR(dgnc_class)) {
+		rc = PTR_ERR(dgnc_class);
+		pr_err(DRVSTR ": Can't create dgnc_mgmt class (%d)\n", rc);
+		goto failed_class;
+	}
+
+	dev = device_create(dgnc_class, NULL,
+			    MKDEV(dgnc_major, 0),
+			NULL, "dgnc_mgmt");
+	if (IS_ERR(dev)) {
+		rc = PTR_ERR(dev);
+		pr_err(DRVSTR ": Can't create device (%d)\n", rc);
+		goto failed_device;
+	}
+
+	/* Start the poller */
+	spin_lock_irqsave(&dgnc_poll_lock, flags);
+	setup_timer(&dgnc_poll_timer, dgnc_poll_handler, 0);
+	dgnc_poll_time = jiffies + dgnc_jiffies_from_ms(dgnc_poll_tick);
+	dgnc_poll_timer.expires = dgnc_poll_time;
+	spin_unlock_irqrestore(&dgnc_poll_lock, flags);
+
+	add_timer(&dgnc_poll_timer);
+
+	return 0;
+
+failed_device:
+	class_destroy(dgnc_class);
+failed_class:
+	unregister_chrdev(dgnc_major, "dgnc");
+	return rc;
+}
+
+/*
+ * dgnc_cleanup_board()
+ *
+ * Free all the memory associated with a board
+ */
+static void dgnc_cleanup_board(struct dgnc_board *brd)
+{
+	int i = 0;
+
+	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
+		return;
+
+	switch (brd->device) {
+	case PCI_DEVICE_CLASSIC_4_DID:
+	case PCI_DEVICE_CLASSIC_8_DID:
+	case PCI_DEVICE_CLASSIC_4_422_DID:
+	case PCI_DEVICE_CLASSIC_8_422_DID:
+
+		/* Tell card not to interrupt anymore. */
+		outb(0, brd->iobase + 0x4c);
+		break;
+
+	default:
+		break;
+	}
+
+	if (brd->irq)
+		free_irq(brd->irq, brd);
+
+	tasklet_kill(&brd->helper_tasklet);
+
+	if (brd->re_map_membase) {
+		iounmap(brd->re_map_membase);
+		brd->re_map_membase = NULL;
+	}
+
+	/* Free all allocated channels structs */
+	for (i = 0; i < MAXPORTS ; i++) {
+		if (brd->channels[i]) {
+			kfree(brd->channels[i]->ch_rqueue);
+			kfree(brd->channels[i]->ch_equeue);
+			kfree(brd->channels[i]->ch_wqueue);
+			kfree(brd->channels[i]);
+			brd->channels[i] = NULL;
+		}
+	}
+
+	dgnc_board[brd->boardnum] = NULL;
+
+	kfree(brd);
+}
+
+/************************************************************************
+ *
+ * Driver load/unload functions
+ *
+ ************************************************************************/
+
+static void cleanup(bool sysfiles)
+{
+	int i;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dgnc_poll_lock, flags);
+	dgnc_poll_stop = 1;
+	spin_unlock_irqrestore(&dgnc_poll_lock, flags);
+
+	/* Turn off poller right away. */
+	del_timer_sync(&dgnc_poll_timer);
+
+	if (sysfiles)
+		dgnc_remove_driver_sysfiles(&dgnc_driver);
+
+	device_destroy(dgnc_class, MKDEV(dgnc_major, 0));
+	class_destroy(dgnc_class);
+	unregister_chrdev(dgnc_major, "dgnc");
+
+	for (i = 0; i < dgnc_num_boards; ++i) {
+		dgnc_remove_ports_sysfiles(dgnc_board[i]);
+		dgnc_cleanup_tty(dgnc_board[i]);
+		dgnc_cleanup_board(dgnc_board[i]);
+	}
+
+}
+
+/*
+ * dgnc_cleanup_module()
+ *
+ * Module unload.  This is where it all ends.
+ */
+static void __exit dgnc_cleanup_module(void)
+{
+	cleanup(true);
+	pci_unregister_driver(&dgnc_driver);
+}
+
+/*
+ * init_module()
+ *
+ * Module load.  This is where it all starts.
+ */
+static int __init dgnc_init_module(void)
+{
+	int rc;
+
+	/*
+	 * Initialize global stuff
+	 */
+	rc = dgnc_start();
+
+	if (rc < 0)
+		return rc;
+
+	/*
+	 * Find and configure all the cards
+	 */
+	rc = pci_register_driver(&dgnc_driver);
+	if (rc) {
+		pr_warn("WARNING: dgnc driver load failed.  No Digi Neo or Classic boards found.\n");
+		cleanup(false);
+		return rc;
+	}
+	dgnc_create_driver_sysfiles(&dgnc_driver);
+
+	return 0;
+}
+
+module_init(dgnc_init_module);
+module_exit(dgnc_cleanup_module);
+
+
-- 
1.9.1

