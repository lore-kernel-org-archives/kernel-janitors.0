From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 01 Apr 2016 08:28:44 +0000
Subject: [PATCH 2/2] staging: dgnc: fix CamelCase in dgnc_tty.c
Message-Id: <20160401082844.GA17592@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix checkpatch.pl warning about 'Avoid CamelCase'

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 2 +-
 drivers/staging/dgnc/digi.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 5d8da41..074988d 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -2931,7 +2931,7 @@ static int dgnc_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		 * Figure out how much data the RealPort Server believes should
 		 * be in our TX queue.
 		 */
-		tdist = (buf.tIn - buf.tOut) & 0xffff;
+		tdist = (buf.tx_in - buf.tx_out) & 0xffff;
 
 		/*
 		 * If we have more data than the RealPort Server believes we
diff --git a/drivers/staging/dgnc/digi.h b/drivers/staging/dgnc/digi.h
index 523a2d3..5b983e6 100644
--- a/drivers/staging/dgnc/digi.h
+++ b/drivers/staging/dgnc/digi.h
@@ -109,8 +109,8 @@ struct digi_info {
 
 struct digi_getbuffer /* Struct for holding buffer use counts */
 {
-	unsigned long tIn;
-	unsigned long tOut;
+	unsigned long tx_in;
+	unsigned long tx_out;
 	unsigned long rxbuf;
 	unsigned long txbuf;
 	unsigned long txdone;
-- 
1.9.1

