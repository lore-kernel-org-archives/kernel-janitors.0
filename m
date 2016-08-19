From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 19 Aug 2016 01:05:19 +0000
Subject: [PATCH 2/2] staging: dgnc: refactor the dgnc_maxcps_room() to improve
Message-Id: <20160819010519.GA8031@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The whole code in dgnc_maxcps_room() function surrounds with
one if-statement for checking channel's maxcps and buffer size.
I tried to separate the logic for this function from if-condition.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 46 +++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 31b18e6..cb31b83 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1494,30 +1494,32 @@ static int dgnc_tty_chars_in_buffer(struct tty_struct *tty)
  */
 static int dgnc_maxcps_room(struct channel_t *ch, int bytes_available)
 {
-	if (ch->ch_digi.digi_maxcps > 0 && ch->ch_digi.digi_bufsize > 0) {
-		int cps_limit = 0;
-		unsigned long current_time = jiffies;
-		unsigned long buffer_time = current_time +
-			(HZ * ch->ch_digi.digi_bufsize) /
-			ch->ch_digi.digi_maxcps;
-
-		if (ch->ch_cpstime < current_time) {
-			/* buffer is empty */
-			ch->ch_cpstime = current_time;	/* reset ch_cpstime */
-			cps_limit = ch->ch_digi.digi_bufsize;
-		} else if (ch->ch_cpstime < buffer_time) {
-			/* still room in the buffer */
-			cps_limit = ((buffer_time - ch->ch_cpstime) *
-					ch->ch_digi.digi_maxcps) / HZ;
-		} else {
-			/* no room in the buffer */
-			cps_limit = 0;
-		}
-
-		bytes_available = min(cps_limit, bytes_available);
+	int cps_limit;
+	unsigned long current_time;
+	unsigned long buffer_time;
+
+	if (ch->ch_digi.digi_maxcps <= 0 ||
+	    ch->ch_digi.digi_bufsize <= 0)
+		return bytes_available;
+
+	current_time = jiffies;
+	buffer_time = current_time + (HZ * ch->ch_digi.digi_bufsize) /
+		      ch->ch_digi.digi_maxcps;
+
+	if (ch->ch_cpstime < current_time) {
+		/* buffer is empty */
+		ch->ch_cpstime = current_time;	/* reset ch_cpstime */
+		cps_limit = ch->ch_digi.digi_bufsize;
+	} else if (ch->ch_cpstime < buffer_time) {
+		/* still room in the buffer */
+		cps_limit = ((buffer_time - ch->ch_cpstime) *
+				ch->ch_digi.digi_maxcps) / HZ;
+	} else {
+		/* no room in the buffer */
+		cps_limit = 0;
 	}
 
-	return bytes_available;
+	return min(cps_limit, bytes_available);
 }
 
 /*
-- 
1.9.1

