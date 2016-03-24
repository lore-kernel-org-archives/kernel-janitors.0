From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 24 Mar 2016 06:10:43 +0000
Subject: [PATCH 1/2] staging: dgnc: fix CamelCase in dgnc_drvier.h and
Message-Id: <20160324061043.GA11766@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix checkpatch.pl warning about CamelCase

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.h | 12 ++++++------
 drivers/staging/dgnc/dgnc_tty.c    | 32 ++++++++++++++++----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index f3d00df..3d8e15f 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -203,15 +203,15 @@ struct dgnc_board {
 						 */
 
 	struct tty_driver serial_driver;
-	char		SerialName[200];
+	char		serial_name[200];
 	struct tty_driver print_driver;
-	char		PrintName[200];
+	char		print_name[200];
 
-	bool		dgnc_Major_Serial_Registered;
-	bool		dgnc_Major_TransparentPrint_Registered;
+	bool		dgnc_major_serial_registered;
+	bool		dgnc_major_transparent_print_registered;
 
-	uint		dgnc_Serial_Major;
-	uint		dgnc_TransparentPrint_Major;
+	uint		dgnc_serial_major;
+	uint		dgnc_transparent_print_major;
 
 	uint		TtyRefCnt;
 
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 081ac75..98b88d1 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -180,9 +180,9 @@ int dgnc_tty_register(struct dgnc_board *brd)
 
 	brd->serial_driver.magic = TTY_DRIVER_MAGIC;
 
-	snprintf(brd->SerialName, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
+	snprintf(brd->serial_name, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
 
-	brd->serial_driver.name = brd->SerialName;
+	brd->serial_driver.name = brd->serial_name;
 	brd->serial_driver.name_base = 0;
 	brd->serial_driver.major = 0;
 	brd->serial_driver.minor_start = 0;
@@ -218,7 +218,7 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 */
 	tty_set_operations(&brd->serial_driver, &dgnc_tty_ops);
 
-	if (!brd->dgnc_Major_Serial_Registered) {
+	if (!brd->dgnc_major_serial_registered) {
 		/* Register tty devices */
 		rc = tty_register_driver(&brd->serial_driver);
 		if (rc < 0) {
@@ -226,7 +226,7 @@ int dgnc_tty_register(struct dgnc_board *brd)
 				"Can't register tty device (%d)\n", rc);
 			return rc;
 		}
-		brd->dgnc_Major_Serial_Registered = true;
+		brd->dgnc_major_serial_registered = true;
 	}
 
 	/*
@@ -235,9 +235,9 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * we are when we get into the dgnc_tty_open() routine.
 	 */
 	brd->print_driver.magic = TTY_DRIVER_MAGIC;
-	snprintf(brd->PrintName, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
+	snprintf(brd->print_name, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
 
-	brd->print_driver.name = brd->PrintName;
+	brd->print_driver.name = brd->print_name;
 	brd->print_driver.name_base = 0;
 	brd->print_driver.major = brd->serial_driver.major;
 	brd->print_driver.minor_start = 0x80;
@@ -273,7 +273,7 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 */
 	tty_set_operations(&brd->print_driver, &dgnc_tty_ops);
 
-	if (!brd->dgnc_Major_TransparentPrint_Registered) {
+	if (!brd->dgnc_major_transparent_print_registered) {
 		/* Register Transparent Print devices */
 		rc = tty_register_driver(&brd->print_driver);
 		if (rc < 0) {
@@ -282,12 +282,12 @@ int dgnc_tty_register(struct dgnc_board *brd)
 				rc);
 			return rc;
 		}
-		brd->dgnc_Major_TransparentPrint_Registered = true;
+		brd->dgnc_major_transparent_print_registered = true;
 	}
 
 	dgnc_BoardsByMajor[brd->serial_driver.major] = brd;
-	brd->dgnc_Serial_Major = brd->serial_driver.major;
-	brd->dgnc_TransparentPrint_Major = brd->print_driver.major;
+	brd->dgnc_serial_major = brd->serial_driver.major;
+	brd->dgnc_transparent_print_major = brd->print_driver.major;
 
 	return rc;
 }
@@ -407,9 +407,9 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 {
 	int i = 0;
 
-	if (brd->dgnc_Major_Serial_Registered) {
+	if (brd->dgnc_major_serial_registered) {
 		dgnc_BoardsByMajor[brd->serial_driver.major] = NULL;
-		brd->dgnc_Serial_Major = 0;
+		brd->dgnc_serial_major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
@@ -417,12 +417,12 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 			tty_unregister_device(&brd->serial_driver, i);
 		}
 		tty_unregister_driver(&brd->serial_driver);
-		brd->dgnc_Major_Serial_Registered = false;
+		brd->dgnc_major_serial_registered = false;
 	}
 
-	if (brd->dgnc_Major_TransparentPrint_Registered) {
+	if (brd->dgnc_major_transparent_print_registered) {
 		dgnc_BoardsByMajor[brd->print_driver.major] = NULL;
-		brd->dgnc_TransparentPrint_Major = 0;
+		brd->dgnc_transparent_print_major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
@@ -430,7 +430,7 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 			tty_unregister_device(&brd->print_driver, i);
 		}
 		tty_unregister_driver(&brd->print_driver);
-		brd->dgnc_Major_TransparentPrint_Registered = false;
+		brd->dgnc_major_transparent_print_registered = false;
 	}
 
 	kfree(brd->serial_driver.ttys);
-- 
1.9.1

