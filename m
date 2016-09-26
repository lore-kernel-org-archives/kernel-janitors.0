From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 26 Sep 2016 00:47:20 +0000
Subject: [PATCH 11/11 RESEND] staging: dgnc: introduce find_board_by_major()
Message-Id: <20160926004720.GA3992@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It was used to get a board structure with dgnc_BoardsByMajor array.
But this driver already has the array for managing initialized board
as dgap_board[]. It can be used for searching the board structure
by major number.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
RESEND: send the whole series again. Because I missed some patches
when the V2 patches sent.

 drivers/staging/dgnc/dgnc_tty.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index ba724ab..a486a86 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -45,7 +45,6 @@
 /*
  * internal variables
  */
-static struct dgnc_board	*dgnc_BoardsByMajor[256];
 static unsigned char		*dgnc_TmpWriteBuf;
 
 /*
@@ -251,8 +250,6 @@ int dgnc_tty_register(struct dgnc_board *brd)
 		goto free_print_driver;
 	}
 
-	dgnc_BoardsByMajor[brd->serial_driver->major] = brd;
-
 	return 0;
 
 free_print_driver:
@@ -388,7 +385,6 @@ void dgnc_cleanup_tty(struct dgnc_board *brd)
 {
 	int i = 0;
 
-	dgnc_BoardsByMajor[brd->serial_driver->major] = NULL;
 	for (i = 0; i < brd->nasync; i++) {
 		if (brd->channels[i])
 			dgnc_remove_tty_sysfs(brd->channels[i]->
@@ -397,7 +393,6 @@ void dgnc_cleanup_tty(struct dgnc_board *brd)
 	}
 	tty_unregister_driver(brd->serial_driver);
 
-	dgnc_BoardsByMajor[brd->print_driver->major] = NULL;
 	for (i = 0; i < brd->nasync; i++) {
 		if (brd->channels[i])
 			dgnc_remove_tty_sysfs(brd->channels[i]->
@@ -935,6 +930,24 @@ void dgnc_wakeup_writes(struct channel_t *ch)
 	spin_unlock_irqrestore(&ch->ch_lock, flags);
 }
 
+struct dgnc_board *find_board_by_major(unsigned int major)
+{
+	int i;
+
+	for (i = 0; i < MAXBOARDS; i++) {
+		struct dgnc_board *brd = dgnc_board[i];
+
+		if (!brd)
+			return NULL;
+
+		if (major = brd->serial_driver->major ||
+		    major = brd->print_driver->major)
+			return brd;
+	}
+
+	return NULL;
+}
+
 /************************************************************************
  *
  * TTY Entry points and helper functions
@@ -964,7 +977,7 @@ static int dgnc_tty_open(struct tty_struct *tty, struct file *file)
 		return -ENXIO;
 
 	/* Get board pointer from our array of majors we have allocated */
-	brd = dgnc_BoardsByMajor[major];
+	brd = find_board_by_major(major);
 	if (!brd)
 		return -ENXIO;
 
-- 
1.9.1

