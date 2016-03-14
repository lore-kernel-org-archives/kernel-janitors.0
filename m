From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 14 Mar 2016 04:28:01 +0000
Subject: [PATCH 1/3] staging: dgnc: fix camelcase of SerialDriver and
Message-Id: <20160314042801.GA4289@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.h |   4 +-
 drivers/staging/dgnc/dgnc_tty.c    | 118 ++++++++++++++++++-------------------
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index e4be81b..953c891 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -202,9 +202,9 @@ struct dgnc_board {
 						 * to our channels.
 						 */
 
-	struct tty_driver	SerialDriver;
+	struct tty_driver serial_driver;
 	char		SerialName[200];
-	struct tty_driver	PrintDriver;
+	struct tty_driver print_driver;
 	char		PrintName[200];
 
 	bool		dgnc_Major_Serial_Registered;
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index f33c3b5..51251ef 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -178,20 +178,20 @@ int dgnc_tty_register(struct dgnc_board *brd)
 {
 	int rc = 0;
 
-	brd->SerialDriver.magic = TTY_DRIVER_MAGIC;
+	brd->serial_driver.magic = TTY_DRIVER_MAGIC;
 
 	snprintf(brd->SerialName, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
 
-	brd->SerialDriver.name = brd->SerialName;
-	brd->SerialDriver.name_base = 0;
-	brd->SerialDriver.major = 0;
-	brd->SerialDriver.minor_start = 0;
-	brd->SerialDriver.num = brd->maxports;
-	brd->SerialDriver.type = TTY_DRIVER_TYPE_SERIAL;
-	brd->SerialDriver.subtype = SERIAL_TYPE_NORMAL;
-	brd->SerialDriver.init_termios = DgncDefaultTermios;
-	brd->SerialDriver.driver_name = DRVSTR;
-	brd->SerialDriver.flags = (TTY_DRIVER_REAL_RAW |
+	brd->serial_driver.name = brd->SerialName;
+	brd->serial_driver.name_base = 0;
+	brd->serial_driver.major = 0;
+	brd->serial_driver.minor_start = 0;
+	brd->serial_driver.num = brd->maxports;
+	brd->serial_driver.type = TTY_DRIVER_TYPE_SERIAL;
+	brd->serial_driver.subtype = SERIAL_TYPE_NORMAL;
+	brd->serial_driver.init_termios = DgncDefaultTermios;
+	brd->serial_driver.driver_name = DRVSTR;
+	brd->serial_driver.flags = (TTY_DRIVER_REAL_RAW |
 				   TTY_DRIVER_DYNAMIC_DEV |
 				   TTY_DRIVER_HARDWARE_BREAK);
 
@@ -199,28 +199,28 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * The kernel wants space to store pointers to
 	 * tty_struct's and termios's.
 	 */
-	brd->SerialDriver.ttys = kcalloc(brd->maxports,
-					 sizeof(*brd->SerialDriver.ttys),
+	brd->serial_driver.ttys = kcalloc(brd->maxports,
+					 sizeof(*brd->serial_driver.ttys),
 					 GFP_KERNEL);
-	if (!brd->SerialDriver.ttys)
+	if (!brd->serial_driver.ttys)
 		return -ENOMEM;
 
-	kref_init(&brd->SerialDriver.kref);
-	brd->SerialDriver.termios = kcalloc(brd->maxports,
-					    sizeof(*brd->SerialDriver.termios),
+	kref_init(&brd->serial_driver.kref);
+	brd->serial_driver.termios = kcalloc(brd->maxports,
+					    sizeof(*brd->serial_driver.termios),
 					    GFP_KERNEL);
-	if (!brd->SerialDriver.termios)
+	if (!brd->serial_driver.termios)
 		return -ENOMEM;
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
 	 * tty_io.c and n_tty.c.
 	 */
-	tty_set_operations(&brd->SerialDriver, &dgnc_tty_ops);
+	tty_set_operations(&brd->serial_driver, &dgnc_tty_ops);
 
 	if (!brd->dgnc_Major_Serial_Registered) {
 		/* Register tty devices */
-		rc = tty_register_driver(&brd->SerialDriver);
+		rc = tty_register_driver(&brd->serial_driver);
 		if (rc < 0) {
 			dev_dbg(&brd->pdev->dev,
 				"Can't register tty device (%d)\n", rc);
@@ -234,19 +234,19 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * again, separately so we don't get the LD confused about what major
 	 * we are when we get into the dgnc_tty_open() routine.
 	 */
-	brd->PrintDriver.magic = TTY_DRIVER_MAGIC;
+	brd->print_driver.magic = TTY_DRIVER_MAGIC;
 	snprintf(brd->PrintName, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
 
-	brd->PrintDriver.name = brd->PrintName;
-	brd->PrintDriver.name_base = 0;
-	brd->PrintDriver.major = brd->SerialDriver.major;
-	brd->PrintDriver.minor_start = 0x80;
-	brd->PrintDriver.num = brd->maxports;
-	brd->PrintDriver.type = TTY_DRIVER_TYPE_SERIAL;
-	brd->PrintDriver.subtype = SERIAL_TYPE_NORMAL;
-	brd->PrintDriver.init_termios = DgncDefaultTermios;
-	brd->PrintDriver.driver_name = DRVSTR;
-	brd->PrintDriver.flags = (TTY_DRIVER_REAL_RAW |
+	brd->print_driver.name = brd->PrintName;
+	brd->print_driver.name_base = 0;
+	brd->print_driver.major = brd->serial_driver.major;
+	brd->print_driver.minor_start = 0x80;
+	brd->print_driver.num = brd->maxports;
+	brd->print_driver.type = TTY_DRIVER_TYPE_SERIAL;
+	brd->print_driver.subtype = SERIAL_TYPE_NORMAL;
+	brd->print_driver.init_termios = DgncDefaultTermios;
+	brd->print_driver.driver_name = DRVSTR;
+	brd->print_driver.flags = (TTY_DRIVER_REAL_RAW |
 				  TTY_DRIVER_DYNAMIC_DEV |
 				  TTY_DRIVER_HARDWARE_BREAK);
 
@@ -255,27 +255,27 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * tty_struct's and termios's.  Must be separated from
 	 * the Serial Driver so we don't get confused
 	 */
-	brd->PrintDriver.ttys = kcalloc(brd->maxports,
-					sizeof(*brd->PrintDriver.ttys),
+	brd->print_driver.ttys = kcalloc(brd->maxports,
+					sizeof(*brd->print_driver.ttys),
 					GFP_KERNEL);
-	if (!brd->PrintDriver.ttys)
+	if (!brd->print_driver.ttys)
 		return -ENOMEM;
-	kref_init(&brd->PrintDriver.kref);
-	brd->PrintDriver.termios = kcalloc(brd->maxports,
-					   sizeof(*brd->PrintDriver.termios),
+	kref_init(&brd->print_driver.kref);
+	brd->print_driver.termios = kcalloc(brd->maxports,
+					   sizeof(*brd->print_driver.termios),
 					   GFP_KERNEL);
-	if (!brd->PrintDriver.termios)
+	if (!brd->print_driver.termios)
 		return -ENOMEM;
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
 	 * tty_io.c and n_tty.c.
 	 */
-	tty_set_operations(&brd->PrintDriver, &dgnc_tty_ops);
+	tty_set_operations(&brd->print_driver, &dgnc_tty_ops);
 
 	if (!brd->dgnc_Major_TransparentPrint_Registered) {
 		/* Register Transparent Print devices */
-		rc = tty_register_driver(&brd->PrintDriver);
+		rc = tty_register_driver(&brd->print_driver);
 		if (rc < 0) {
 			dev_dbg(&brd->pdev->dev,
 				"Can't register Transparent Print device(%d)\n",
@@ -285,9 +285,9 @@ int dgnc_tty_register(struct dgnc_board *brd)
 		brd->dgnc_Major_TransparentPrint_Registered = true;
 	}
 
-	dgnc_BoardsByMajor[brd->SerialDriver.major] = brd;
-	brd->dgnc_Serial_Major = brd->SerialDriver.major;
-	brd->dgnc_TransparentPrint_Major = brd->PrintDriver.major;
+	dgnc_BoardsByMajor[brd->serial_driver.major] = brd;
+	brd->dgnc_Serial_Major = brd->serial_driver.major;
+	brd->dgnc_TransparentPrint_Major = brd->print_driver.major;
 
 	return rc;
 }
@@ -364,12 +364,12 @@ int dgnc_tty_init(struct dgnc_board *brd)
 		{
 			struct device *classp;
 
-			classp = tty_register_device(&brd->SerialDriver, i,
+			classp = tty_register_device(&brd->serial_driver, i,
 						     &ch->ch_bd->pdev->dev);
 			ch->ch_tun.un_sysfs = classp;
 			dgnc_create_tty_sysfs(&ch->ch_tun, classp);
 
-			classp = tty_register_device(&brd->PrintDriver, i,
+			classp = tty_register_device(&brd->print_driver, i,
 						     &ch->ch_bd->pdev->dev);
 			ch->ch_pun.un_sysfs = classp;
 			dgnc_create_tty_sysfs(&ch->ch_pun, classp);
@@ -408,39 +408,39 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 	int i = 0;
 
 	if (brd->dgnc_Major_Serial_Registered) {
-		dgnc_BoardsByMajor[brd->SerialDriver.major] = NULL;
+		dgnc_BoardsByMajor[brd->serial_driver.major] = NULL;
 		brd->dgnc_Serial_Major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
 						      ch_tun.un_sysfs);
-			tty_unregister_device(&brd->SerialDriver, i);
+			tty_unregister_device(&brd->serial_driver, i);
 		}
-		tty_unregister_driver(&brd->SerialDriver);
+		tty_unregister_driver(&brd->serial_driver);
 		brd->dgnc_Major_Serial_Registered = false;
 	}
 
 	if (brd->dgnc_Major_TransparentPrint_Registered) {
-		dgnc_BoardsByMajor[brd->PrintDriver.major] = NULL;
+		dgnc_BoardsByMajor[brd->print_driver.major] = NULL;
 		brd->dgnc_TransparentPrint_Major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
 						      ch_pun.un_sysfs);
-			tty_unregister_device(&brd->PrintDriver, i);
+			tty_unregister_device(&brd->print_driver, i);
 		}
-		tty_unregister_driver(&brd->PrintDriver);
+		tty_unregister_driver(&brd->print_driver);
 		brd->dgnc_Major_TransparentPrint_Registered = false;
 	}
 
-	kfree(brd->SerialDriver.ttys);
-	brd->SerialDriver.ttys = NULL;
-	kfree(brd->SerialDriver.termios);
-	brd->SerialDriver.termios = NULL;
-	kfree(brd->PrintDriver.ttys);
-	brd->PrintDriver.ttys = NULL;
-	kfree(brd->PrintDriver.termios);
-	brd->PrintDriver.termios = NULL;
+	kfree(brd->serial_driver.ttys);
+	brd->serial_driver.ttys = NULL;
+	kfree(brd->serial_driver.termios);
+	brd->serial_driver.termios = NULL;
+	kfree(brd->print_driver.ttys);
+	brd->print_driver.ttys = NULL;
+	kfree(brd->print_driver.termios);
+	brd->print_driver.termios = NULL;
 }
 
 /*
-- 
1.9.1

