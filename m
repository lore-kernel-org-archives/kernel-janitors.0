From: Tillmann Heidsieck <theidsieck@leenox.de>
Date: Wed, 23 Sep 2015 20:07:55 +0000
Subject: [PATCH 3/3] staging: wlan-ng remove unnessecary variable
Message-Id: <1443038876-15753-4-git-send-email-theidsieck@leenox.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The result variable is not set anywhere beyond its initialization,
therefore it can be remove.

Signed-off-by: Tillmann Heidsieck <theidsieck@leenox.de>
---
 drivers/staging/wlan-ng/prism2fw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index f5b9727..8fc80df 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -584,7 +584,6 @@ static int mkimage(struct imgchunk *clist, unsigned int *ccnt)
 ----------------------------------------------------------------*/
 static int mkpdrlist(struct pda *pda)
 {
-	int result = 0;
 	u16 *pda16 = (u16 *) pda->buf;
 	int curroff;		/* in 'words' */
 
@@ -633,7 +632,7 @@ static int mkpdrlist(struct pda *pda)
 	}
 	pda->rec[pda->nrec] = (hfa384x_pdrec_t *) &(pda16[curroff]);
 	(pda->nrec)++;
-	return result;
+	return 0;
 }
 
 /*----------------------------------------------------------------
-- 
2.5.3

