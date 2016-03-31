From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 31 Mar 2016 08:03:35 +0000
Subject: [PATCH 1/2] staging: dgnc: remove useless variables for saving tty's
Message-Id: <20160331080335.GA27013@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It doesn't need to save major number with variable.
And there are no use of these variables(dgnc_serial_major and
dgnc_transparent_print_major)

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.h | 3 ---
 drivers/staging/dgnc/dgnc_tty.c    | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 44216ae..6609ba5 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -210,9 +210,6 @@ struct dgnc_board {
 	bool		dgnc_major_serial_registered;
 	bool		dgnc_major_transparent_print_registered;
 
-	uint		dgnc_serial_major;
-	uint		dgnc_transparent_print_major;
-
 	u16		dpatype;	/* The board "type",
 					 * as defined by DPA
 					 */
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 98b88d1..5097208 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -286,8 +286,6 @@ int dgnc_tty_register(struct dgnc_board *brd)
 	}
 
 	dgnc_BoardsByMajor[brd->serial_driver.major] = brd;
-	brd->dgnc_serial_major = brd->serial_driver.major;
-	brd->dgnc_transparent_print_major = brd->print_driver.major;
 
 	return rc;
 }
@@ -409,7 +407,6 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 
 	if (brd->dgnc_major_serial_registered) {
 		dgnc_BoardsByMajor[brd->serial_driver.major] = NULL;
-		brd->dgnc_serial_major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
@@ -422,7 +419,6 @@ void dgnc_tty_uninit(struct dgnc_board *brd)
 
 	if (brd->dgnc_major_transparent_print_registered) {
 		dgnc_BoardsByMajor[brd->print_driver.major] = NULL;
-		brd->dgnc_transparent_print_major = 0;
 		for (i = 0; i < brd->nasync; i++) {
 			if (brd->channels[i])
 				dgnc_remove_tty_sysfs(brd->channels[i]->
-- 
1.9.1

