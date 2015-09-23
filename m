From: Tillmann Heidsieck <theidsieck@leenox.de>
Date: Wed, 23 Sep 2015 20:07:54 +0000
Subject: [PATCH 2/3] staging: wlan-ng remove redundant conditional
Message-Id: <1443038876-15753-3-git-send-email-theidsieck@leenox.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We exit the above loop either if curroff >= (HFA384x_PDA_LEN_MAX / 2 - 1)
or if we found the END marker in the element beyond the current one. The
first case is checked for in the preceding if statement, therefore the
second if statement is redundant and can be removed.

Signed-off-by: Tillmann Heidsieck <theidsieck@leenox.de>
---
 drivers/staging/wlan-ng/prism2fw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index d357b7e..f5b9727 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -631,10 +631,8 @@ static int mkpdrlist(struct pda *pda)
 		       curroff, pda->nrec);
 		return 1;
 	}
-	if (le16_to_cpu(pda16[curroff + 1]) = HFA384x_PDR_END_OF_PDA) {
-		pda->rec[pda->nrec] = (hfa384x_pdrec_t *) &(pda16[curroff]);
-		(pda->nrec)++;
-	}
+	pda->rec[pda->nrec] = (hfa384x_pdrec_t *) &(pda16[curroff]);
+	(pda->nrec)++;
 	return result;
 }
 
-- 
2.5.3

