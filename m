From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:46:48 +0000
Subject: [PATCH 10/11 RESEND] staging: dgnc: remove useless variables
Message-Id: <20160926004648.GA3973@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_major_serial_registered and dgnc_major_serial_registered
do not need to use to check whether the tty driver is registered or not.
These variables are used only in dgnc_cleanup_tty() function,
This function will be called normally with initialized board structure.
It means the dgnc_cleanup_tty() cannot be called with unregistered tty.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

 drivers/staging/dgnc/dgnc_driver.h |  3 --
 drivers/staging/dgnc/dgnc_tty.c    | 64 +++++++++++++++-----------------------
 2 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 747a100..8792026 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -203,9 +203,6 @@ struct dgnc_board {
 	struct tty_driver *print_driver;
 	char		print_name[200];
 
-	bool		dgnc_major_serial_registered;
-	bool		dgnc_major_transparent_print_registered;
-
 	u16		dpatype;	/* The board "type",
 					 * as defined by DPA
 					 */
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 5befd28..ba724ab 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -204,15 +204,11 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 */
 	tty_set_operations(brd->serial_driver, &dgnc_tty_ops);
 
-	if (!brd->dgnc_major_serial_registered) {
-		/* Register tty devices */
-		rc = tty_register_driver(brd->serial_driver);
-		if (rc < 0) {
-			dev_dbg(&brd->pdev->dev,
-				"Can't register tty device (%d)\n", rc);
-			goto free_serial_driver;
-		}
-		brd->dgnc_major_serial_registered = true;
+	rc = tty_register_driver(brd->serial_driver);
+	if (rc < 0) {
+		dev_dbg(&brd->pdev->dev,
+			"Can't register tty device (%d)\n", rc);
+		goto free_serial_driver;
 	}
 
 	/*
@@ -247,16 +243,12 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 */
 	tty_set_operations(brd->print_driver, &dgnc_tty_ops);
 
-	if (!brd->dgnc_major_transparent_print_registered) {
-		/* Register Transparent Print devices */
-		rc = tty_register_driver(brd->print_driver);
-		if (rc < 0) {
-			dev_dbg(&brd->pdev->dev,
-				"Can't register Transparent Print device(%d)\n",
-				rc);
-			goto free_print_driver;
-		}
-		brd->dgnc_major_transparent_print_registered = true;
+	rc = tty_register_driver(brd->print_driver);
+	if (rc < 0) {
+		dev_dbg(&brd->pdev->dev,
+			"Can't register Transparent Print device(%d)\n",
+			rc);
+		goto free_print_driver;
 	}
 
 	dgnc_BoardsByMajor[brd->serial_driver->major] = brd;
@@ -396,29 +388,23 @@ void dgnc_cleanup_tty(struct dgnc_board *brd)
 {
 	int i = 0;
 
-	if (brd->dgnc_major_serial_registered) {
-		dgnc_BoardsByMajor[brd->serial_driver->major] = NULL;
-		for (i = 0; i < brd->nasync; i++) {
-			if (brd->channels[i])
-				dgnc_remove_tty_sysfs(brd->channels[i]->
-						      ch_tun.un_sysfs);
-			tty_unregister_device(brd->serial_driver, i);
-		}
-		tty_unregister_driver(brd->serial_driver);
-		brd->dgnc_major_serial_registered = false;
+	dgnc_BoardsByMajor[brd->serial_driver->major] = NULL;
+	for (i = 0; i < brd->nasync; i++) {
+		if (brd->channels[i])
+			dgnc_remove_tty_sysfs(brd->channels[i]->
+					      ch_tun.un_sysfs);
+		tty_unregister_device(brd->serial_driver, i);
 	}
+	tty_unregister_driver(brd->serial_driver);
 
-	if (brd->dgnc_major_transparent_print_registered) {
-		dgnc_BoardsByMajor[brd->print_driver->major] = NULL;
-		for (i = 0; i < brd->nasync; i++) {
-			if (brd->channels[i])
-				dgnc_remove_tty_sysfs(brd->channels[i]->
-						      ch_pun.un_sysfs);
-			tty_unregister_device(brd->print_driver, i);
-		}
-		tty_unregister_driver(brd->print_driver);
-		brd->dgnc_major_transparent_print_registered = false;
+	dgnc_BoardsByMajor[brd->print_driver->major] = NULL;
+	for (i = 0; i < brd->nasync; i++) {
+		if (brd->channels[i])
+			dgnc_remove_tty_sysfs(brd->channels[i]->
+					      ch_pun.un_sysfs);
+		tty_unregister_device(brd->print_driver, i);
 	}
+	tty_unregister_driver(brd->print_driver);
 
 	put_tty_driver(brd->serial_driver);
 	put_tty_driver(brd->print_driver);
-- 
1.9.1

