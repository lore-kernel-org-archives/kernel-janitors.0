From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 02 Mar 2016 02:55:19 +0000
Subject: [PATCH 2/2 v2] staging: dgnc: use tty_alloc_driver instead of kcalloc
Message-Id: <20160302025519.GA14596@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

the tty_alloc_driver() can allocate memory for ttys and termios.
And also it can release allocated memory easly with using
put_tty_driver().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
v2 : typo in subject, changed from dgap to dgnc

 drivers/staging/dgnc/dgnc_tty.c | 86 +++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index e91cf70..6437a81 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -176,9 +176,15 @@ int dgnc_tty_preinit(void)
  */
 int dgnc_tty_register(struct dgnc_board *brd)
 {
-	int rc = 0;
+	int rc;
+
+	brd->serial_driver = tty_alloc_driver(brd->maxports,
+					      TTY_DRIVER_REAL_RAW |
+					      TTY_DRIVER_DYNAMIC_DEV |
+					      TTY_DRIVER_HARDWARE_BREAK);
 
-	brd->serial_driver->magic = TTY_DRIVER_MAGIC;
+	if (IS_ERR(brd->serial_driver))
+		return PTR_ERR(brd->serial_driver);
 
 	snprintf(brd->SerialName, MAXTTYNAMELEN, "tty_dgnc_%d_", brd->boardnum);
 
@@ -186,31 +192,10 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	brd->serial_driver->name_base = 0;
 	brd->serial_driver->major = 0;
 	brd->serial_driver->minor_start = 0;
-	brd->serial_driver->num = brd->maxports;
 	brd->serial_driver->type = TTY_DRIVER_TYPE_SERIAL;
 	brd->serial_driver->subtype = SERIAL_TYPE_NORMAL;
 	brd->serial_driver->init_termios = DgncDefaultTermios;
 	brd->serial_driver->driver_name = DRVSTR;
-	brd->serial_driver->flags = (TTY_DRIVER_REAL_RAW |
-				   TTY_DRIVER_DYNAMIC_DEV |
-				   TTY_DRIVER_HARDWARE_BREAK);
-
-	/*
-	 * The kernel wants space to store pointers to
-	 * tty_struct's and termios's.
-	 */
-	brd->serial_driver->ttys = kcalloc(brd->maxports,
-					 sizeof(*brd->serial_driver->ttys),
-					 GFP_KERNEL);
-	if (!brd->serial_driver->ttys)
-		return -ENOMEM;
-
-	kref_init(&brd->serial_driver->kref);
-	brd->serial_driver->termios = kcalloc(brd->maxports,
-					    sizeof(*brd->serial_driver->termios),
-					    GFP_KERNEL);
-	if (!brd->serial_driver->termios)
-		return -ENOMEM;
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
@@ -224,7 +209,7 @@ int dgnc_tty_register(struct dgnc_board *brd)
 		if (rc < 0) {
 			dev_dbg(&brd->pdev->dev,
 				"Can't register tty device (%d)\n", rc);
-			return rc;
+			goto free_serial_driver;
 		}
 		brd->dgnc_Major_Serial_Registered = true;
 	}
@@ -234,38 +219,26 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	 * again, separately so we don't get the LD confused about what major
 	 * we are when we get into the dgnc_tty_open() routine.
 	 */
-	brd->print_driver->magic = TTY_DRIVER_MAGIC;
+	brd->print_driver = tty_alloc_driver(brd->maxports,
+					     TTY_DRIVER_REAL_RAW |
+					     TTY_DRIVER_DYNAMIC_DEV |
+					     TTY_DRIVER_HARDWARE_BREAK);
+
+	if (IS_ERR(brd->print_driver)) {
+		rc = PTR_ERR(brd->print_driver);
+		goto unregister_serial_driver;
+	}
+
 	snprintf(brd->PrintName, MAXTTYNAMELEN, "pr_dgnc_%d_", brd->boardnum);
 
 	brd->print_driver->name = brd->PrintName;
 	brd->print_driver->name_base = 0;
 	brd->print_driver->major = brd->serial_driver->major;
 	brd->print_driver->minor_start = 0x80;
-	brd->print_driver->num = brd->maxports;
 	brd->print_driver->type = TTY_DRIVER_TYPE_SERIAL;
 	brd->print_driver->subtype = SERIAL_TYPE_NORMAL;
 	brd->print_driver->init_termios = DgncDefaultTermios;
 	brd->print_driver->driver_name = DRVSTR;
-	brd->print_driver->flags = (TTY_DRIVER_REAL_RAW |
-				  TTY_DRIVER_DYNAMIC_DEV |
-				  TTY_DRIVER_HARDWARE_BREAK);
-
-	/*
-	 * The kernel wants space to store pointers to
-	 * tty_struct's and termios's.  Must be separated from
-	 * the Serial Driver so we don't get confused
-	 */
-	brd->print_driver->ttys = kcalloc(brd->maxports,
-					sizeof(*brd->print_driver->ttys),
-					GFP_KERNEL);
-	if (!brd->print_driver->ttys)
-		return -ENOMEM;
-	kref_init(&brd->print_driver->kref);
-	brd->print_driver->termios = kcalloc(brd->maxports,
-					   sizeof(*brd->print_driver->termios),
-					   GFP_KERNEL);
-	if (!brd->print_driver->termios)
-		return -ENOMEM;
 
 	/*
 	 * Entry points for driver.  Called by the kernel from
@@ -280,7 +253,7 @@ int dgnc_tty_register(struct dgnc_board *brd)
 			dev_dbg(&brd->pdev->dev,
 				"Can't register Transparent Print device(%d)\n",
 				rc);
-			return rc;
+			goto free_print_driver;
 		}
 		brd->dgnc_Major_TransparentPrint_Registered = true;
 	}
@@ -289,6 +262,15 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	brd->dgnc_Serial_Major = brd->serial_driver->major;
 	brd->dgnc_TransparentPrint_Major = brd->print_driver->major;
 
+	return 0;
+
+free_print_driver:
+	put_tty_driver(brd->print_driver);
+unregister_serial_driver:
+	tty_unregister_driver(brd->serial_driver);
+free_serial_driver:
+	put_tty_driver(brd->serial_driver);
+
 	return rc;
 }
 
@@ -433,14 +415,8 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 		brd->dgnc_Major_TransparentPrint_Registered = false;
 	}
 
-	kfree(brd->serial_driver->ttys);
-	brd->serial_driver->ttys = NULL;
-	kfree(brd->serial_driver->termios);
-	brd->serial_driver->termios = NULL;
-	kfree(brd->print_driver->ttys);
-	brd->print_driver->ttys = NULL;
-	kfree(brd->print_driver->termios);
-	brd->print_driver->termios = NULL;
+	put_tty_driver(brd->serial_driver);
+	put_tty_driver(brd->print_driver);
 }
 
 /*===================================-- 
1.9.1

