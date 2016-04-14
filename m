From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 14 Apr 2016 03:30:13 +0000
Subject: [PATCH] staging: dgnc: use tty_alloc_driver instead of kcalloc
Message-Id: <20160414033013.GA26959@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The tty_alloc_driver() can allocate memory for ttys and termios.
And also allocated memory will be released easily with
put_tty_driver() call.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.h |   4 +-
 drivers/staging/dgnc/dgnc_tty.c    | 144 ++++++++++++++++---------------------
 2 files changed, 62 insertions(+), 86 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 6609ba5..95ec729 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -202,9 +202,9 @@ struct dgnc_board {
 						 * to our channels.
 						 */
 
-	struct tty_driver serial_driver;
+	struct tty_driver *serial_driver;
 	char		serial_name[200];
-	struct tty_driver print_driver;
+	struct tty_driver *print_driver;
 	char		print_name[200];
 
 	bool		dgnc_major_serial_registered;
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 074988d..ccba7fc 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -176,55 +176,40 @@ int dgnc_tty_preinit(void)
  */
 int dgnc_tty_register(struct dgnc_board *brd)
 {
-	int rc = 0;
-
-	brd->serial_driver.magic = TTY_DRIVER_MAGIC;
+	int rc;
 
-	snprintf(brd->serial_name, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
+	brd->serial_driver = tty_alloc_driver(brd->maxports,
+					      TTY_DRIVER_REAL_RAW |
+					      TTY_DRIVER_DYNAMIC_DEV |
+					      TTY_DRIVER_HARDWARE_BREAK);
 
-	brd->serial_driver.name = brd->serial_name;
-	brd->serial_driver.name_base = 0;
-	brd->serial_driver.major = 0;
-	brd->serial_driver.minor_start = 0;
-	brd->serial_driver.num = brd->maxports;
-	brd->serial_driver.type = TTY_DRIVER_TYPE_SERIAL;
-	brd->serial_driver.subtype = SERIAL_TYPE_NORMAL;
-	brd->serial_driver.init_termios = DgncDefaultTermios;
-	brd->serial_driver.driver_name = DRVSTR;
-	brd->serial_driver.flags = (TTY_DRIVER_REAL_RAW |
-				   TTY_DRIVER_DYNAMIC_DEV |
-				   TTY_DRIVER_HARDWARE_BREAK);
+	if (IS_ERR(brd->serial_driver))
+		return PTR_ERR(brd->serial_driver);
 
-	/*
-	 * The kernel wants space to store pointers to
-	 * tty_struct's and termios's.
-	 */
-	brd->serial_driver.ttys = kcalloc(brd->maxports,
-					 sizeof(*brd->serial_driver.ttys),
-					 GFP_KERNEL);
-	if (!brd->serial_driver.ttys)
-		return -ENOMEM;
+	snprintf(brd->serial_name, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
 
-	kref_init(&brd->serial_driver.kref);
-	brd->serial_driver.termios = kcalloc(brd->maxports,
-					    sizeof(*brd->serial_driver.termios),
-					    GFP_KERNEL);
-	if (!brd->serial_driver.termios)
-		return -ENOMEM;
+	brd->serial_driver->name = brd->serial_name;
+	brd->serial_driver->name_base = 0;
+	brd->serial_driver->major = 0;
+	brd->serial_driver->minor_start = 0;
+	brd->serial_driver->type = TTY_DRIVER_TYPE_SERIAL;
+	brd->serial_driver->subtype = SERIAL_TYPE_NORMAL;
+	brd->serial_driver->init_termios = DgncDefaultTermios;
+	brd->serial_driver->driver_name = DRVSTR;
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
 	 * tty_io.c and n_tty.c.
 	 */
-	tty_set_operations(&brd->serial_driver, &dgnc_tty_ops);
+	tty_set_operations(brd->serial_driver, &dgnc_tty_ops);
 
 	if (!brd->dgnc_major_serial_registered) {
 		/* Register tty devices */
-		rc = tty_register_driver(&brd->serial_driver);
+		rc = tty_register_driver(brd->serial_driver);
 		if (rc < 0) {
 			dev_dbg(&brd->pdev->dev,
 				"Can't register tty device (%d)\n", rc);
-			return rc;
+			goto free_serial_driver;
 		}
 		brd->dgnc_major_serial_registered = true;
 	}
@@ -234,58 +219,55 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * again, separately so we don't get the LD confused about what major
 	 * we are when we get into the dgnc_tty_open() routine.
 	 */
-	brd->print_driver.magic = TTY_DRIVER_MAGIC;
-	snprintf(brd->print_name, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
+	brd->print_driver = tty_alloc_driver(brd->maxports,
+					     TTY_DRIVER_REAL_RAW |
+					     TTY_DRIVER_DYNAMIC_DEV |
+					     TTY_DRIVER_HARDWARE_BREAK);
 
-	brd->print_driver.name = brd->print_name;
-	brd->print_driver.name_base = 0;
-	brd->print_driver.major = brd->serial_driver.major;
-	brd->print_driver.minor_start = 0x80;
-	brd->print_driver.num = brd->maxports;
-	brd->print_driver.type = TTY_DRIVER_TYPE_SERIAL;
-	brd->print_driver.subtype = SERIAL_TYPE_NORMAL;
-	brd->print_driver.init_termios = DgncDefaultTermios;
-	brd->print_driver.driver_name = DRVSTR;
-	brd->print_driver.flags = (TTY_DRIVER_REAL_RAW |
-				  TTY_DRIVER_DYNAMIC_DEV |
-				  TTY_DRIVER_HARDWARE_BREAK);
+	snprintf(brd->print_name, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
 
-	/*
-	 * The kernel wants space to store pointers to
-	 * tty_struct's and termios's.  Must be separated from
-	 * the Serial Driver so we don't get confused
-	 */
-	brd->print_driver.ttys = kcalloc(brd->maxports,
-					sizeof(*brd->print_driver.ttys),
-					GFP_KERNEL);
-	if (!brd->print_driver.ttys)
-		return -ENOMEM;
-	kref_init(&brd->print_driver.kref);
-	brd->print_driver.termios = kcalloc(brd->maxports,
-					   sizeof(*brd->print_driver.termios),
-					   GFP_KERNEL);
-	if (!brd->print_driver.termios)
-		return -ENOMEM;
+	brd->print_driver->name = brd->print_name;
+	brd->print_driver->name_base = 0;
+	brd->print_driver->major = brd->serial_driver->major;
+	brd->print_driver->minor_start = 0x80;
+	brd->print_driver->type = TTY_DRIVER_TYPE_SERIAL;
+	brd->print_driver->subtype = SERIAL_TYPE_NORMAL;
+	brd->print_driver->init_termios = DgncDefaultTermios;
+	brd->print_driver->driver_name = DRVSTR;
+
+	if (IS_ERR(brd->print_driver)) {
+		rc = PTR_ERR(brd->print_driver);
+		goto unregister_serial_driver;
+	}
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
 	 * tty_io.c and n_tty.c.
 	 */
-	tty_set_operations(&brd->print_driver, &dgnc_tty_ops);
+	tty_set_operations(brd->print_driver, &dgnc_tty_ops);
 
 	if (!brd->dgnc_major_transparent_print_registered) {
 		/* Register Transparent Print devices */
-		rc = tty_register_driver(&brd->print_driver);
+		rc = tty_register_driver(brd->print_driver);
 		if (rc < 0) {
 			dev_dbg(&brd->pdev->dev,
 				"Can't register Transparent Print device(%d)\n",
 				rc);
-			return rc;
+			goto free_print_driver;
 		}
 		brd->dgnc_major_transparent_print_registered = true;
 	}
 
-	dgnc_BoardsByMajor[brd->serial_driver.major] = brd;
+	dgnc_BoardsByMajor[brd->serial_driver->major] = brd;
+
+	return 0;
+
+free_print_driver:
+	put_tty_driver(brd->print_driver);
+unregister_serial_driver:
+	tty_unregister_driver(brd->serial_driver);
+free_serial_driver:
+	put_tty_driver(brd->serial_driver);
 
 	return rc;
 }
@@ -362,12 +344,12 @@ int dgnc_tty_init(struct dgnc_board *brd)
 		{
 			struct device *classp;
 
-			classp = tty_register_device(&brd->serial_driver, i,
+			classp = tty_register_device(brd->serial_driver, i,
 						     &ch->ch_bd->pdev->dev);
 			ch->ch_tun.un_sysfs = classp;
 			dgnc_create_tty_sysfs(&ch->ch_tun, classp);
 
-			classp = tty_register_device(&brd->print_driver, i,
+			classp = tty_register_device(brd->print_driver, i,
 						     &ch->ch_bd->pdev->dev);
 			ch->ch_pun.un_sysfs = classp;
 			dgnc_create_tty_sysfs(&ch->ch_pun, classp);
@@ -406,37 +388,31 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 	int i = 0;
 
 	if (brd->dgnc_major_serial_registered) {
-		dgnc_BoardsByMajor[brd->serial_driver.major] = NULL;
+		dgnc_BoardsByMajor[brd->serial_driver->major] = NULL;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
 						      ch_tun.un_sysfs);
-			tty_unregister_device(&brd->serial_driver, i);
+			tty_unregister_device(brd->serial_driver, i);
 		}
-		tty_unregister_driver(&brd->serial_driver);
+		tty_unregister_driver(brd->serial_driver);
 		brd->dgnc_major_serial_registered = false;
 	}
 
 	if (brd->dgnc_major_transparent_print_registered) {
-		dgnc_BoardsByMajor[brd->print_driver.major] = NULL;
+		dgnc_BoardsByMajor[brd->print_driver->major] = NULL;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
 						      ch_pun.un_sysfs);
-			tty_unregister_device(&brd->print_driver, i);
+			tty_unregister_device(brd->print_driver, i);
 		}
-		tty_unregister_driver(&brd->print_driver);
+		tty_unregister_driver(brd->print_driver);
 		brd->dgnc_major_transparent_print_registered = false;
 	}
 
-	kfree(brd->serial_driver.ttys);
-	brd->serial_driver.ttys = NULL;
-	kfree(brd->serial_driver.termios);
-	brd->serial_driver.termios = NULL;
-	kfree(brd->print_driver.ttys);
-	brd->print_driver.ttys = NULL;
-	kfree(brd->print_driver.termios);
-	brd->print_driver.termios = NULL;
+	put_tty_driver(brd->serial_driver);
+	put_tty_driver(brd->print_driver);
 }
 
 /*
-- 
2.8.1

