From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 09 May 2016 02:47:34 +0000
Subject: [PATCH 3/3] staging: dgnc: Need to check for NULL of ch
Message-Id: <20160509024734.GA6926@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the "ch" from brd structure could be NULL, it need to
check for NULL.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 9eae1a6..ba57e95 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -380,7 +380,7 @@ static inline void neo_parse_isr(struct dgnc_board *brd, uint port)
 	unsigned long flags;
 
 	ch = brd->channels[port];
-	if (ch->magic != DGNC_CHANNEL_MAGIC)
+	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
 	/* Here we try to figure out what caused the interrupt to happen */
-- 
2.8.2

