From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 14 Sep 2018 02:38:30 +0000
Subject: [PATCH -next] [SCSI] aic7xxx: Use kmemdup rather than duplicating its implementation in ahc_loadseq
Message-Id: <1536892710-132433-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/aic7xxx/aic7xxx_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_core.c b/drivers/scsi/aic7xxx/aic7xxx_core.c
index f3362f4..8549f1e 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_core.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_core.c
@@ -6901,10 +6901,10 @@ struct ahc_softc *
 	if (cs_count != 0) {
 
 		cs_count *= sizeof(struct cs);
-		ahc->critical_sections = kmalloc(cs_count, GFP_ATOMIC);
+		ahc->critical_sections = kmemdup(cs_table, cs_count,
+						 GFP_ATOMIC);
 		if (ahc->critical_sections = NULL)
 			panic("ahc_loadseq: Could not malloc");
-		memcpy(ahc->critical_sections, cs_table, cs_count);
 	}
 	ahc_outb(ahc, SEQCTL, PERRORDIS|FAILDIS|FASTMODE);
