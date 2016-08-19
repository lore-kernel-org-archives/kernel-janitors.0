From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 19 Aug 2016 01:04:52 +0000
Subject: [PATCH 1/2] staging: dgnc: change a parameter from tty_struct to
Message-Id: <20160819010452.GA8009@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The dgnc_maxcps_room() function must be called only for print device.
The if-statement for checking print device checks before calling
maxcps_room() and also this function doesn't need to have any
data except channel_t.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index e4c6c3f..31b18e6 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1492,18 +1492,8 @@ static int dgnc_tty_chars_in_buffer(struct tty_struct *tty)
  * returns the new bytes_available.  This only affects printer
  * output.
  */
-static int dgnc_maxcps_room(struct tty_struct *tty, int bytes_available)
+static int dgnc_maxcps_room(struct channel_t *ch, int bytes_available)
 {
-	struct un_t *un = tty->driver_data;
-	struct channel_t *ch = un->un_ch;
-
-	/*
-	 * If its not the Transparent print device, return
-	 * the full data amount.
-	 */
-	if (un->un_type != DGNC_PRINT)
-		return bytes_available;
-
 	if (ch->ch_digi.digi_maxcps > 0 && ch->ch_digi.digi_bufsize > 0) {
 		int cps_limit = 0;
 		unsigned long current_time = jiffies;
@@ -1567,7 +1557,8 @@ static int dgnc_tty_write_room(struct tty_struct *tty)
 		ret += WQUEUESIZE;
 
 	/* Limit printer to maxcps */
-	ret = dgnc_maxcps_room(tty, ret);
+	if (un->un_type != DGNC_PRINT)
+		ret = dgnc_maxcps_room(ch, ret);
 
 	/*
 	 * If we are printer device, leave space for
@@ -1659,7 +1650,8 @@ static int dgnc_tty_write(struct tty_struct *tty,
 	 * Limit printer output to maxcps overall, with bursts allowed
 	 * up to bufsize characters.
 	 */
-	bufcount = dgnc_maxcps_room(tty, bufcount);
+	if (un->un_type != DGNC_PRINT)
+		bufcount = dgnc_maxcps_room(ch, bufcount);
 
 	/*
 	 * Take minimum of what the user wants to send, and the
-- 
1.9.1

