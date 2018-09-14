From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 14 Sep 2018 02:38:42 +0000
Subject: [PATCH -next] [SCSI] aic79xx: Use kmemdup rather than duplicating its implementation in ahd_loadseq
Message-Id: <1536892722-132553-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/aic7xxx/aic79xx_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 9ee75c9..0970bb5 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -9438,10 +9438,10 @@ struct scb *
 	if (cs_count != 0) {
 
 		cs_count *= sizeof(struct cs);
-		ahd->critical_sections = kmalloc(cs_count, GFP_ATOMIC);
+		ahd->critical_sections = kmemdup(cs_table, cs_count,
+						 GFP_ATOMIC);
 		if (ahd->critical_sections = NULL)
 			panic("ahd_loadseq: Could not malloc");
-		memcpy(ahd->critical_sections, cs_table, cs_count);
 	}
 	ahd_outb(ahd, SEQCTL0, PERRORDIS|FAILDIS|FASTMODE);
