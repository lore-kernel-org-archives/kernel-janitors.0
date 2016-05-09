From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 09 May 2016 02:47:11 +0000
Subject: [PATCH 2/3] staging: dgnc: remove redundant condition check
Message-Id: <20160509024711.GA6911@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

dgnc_board(brd) was already checked for NULL before calling
neo_parse_isr(). And also port doesn't need to check.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 3b8ce38..9eae1a6 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -379,12 +379,6 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 	unsigned char cause;
 	unsigned long flags;
 
-	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
-		return;
-
-	if (port >= brd->maxports)
-		return;
-
 	ch = brd->channels[port];
 	if (ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
-- 
2.8.2

