From: Tillmann Heidsieck <theidsieck@leenox.de>
Date: Wed, 23 Sep 2015 20:07:53 +0000
Subject: [PATCH 1/3] staging: wlan-ng fix buffer overflow in firmware handling
Message-Id: <1443038876-15753-2-git-send-email-theidsieck@leenox.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We test for an END marker in the element beyond the current one, this
effectively limits the size of the array to be HFA384x_PDA_LEN_MAX/2 - 1
not HFA384x_PDR_END_OF_PDA/2. This patch fixes a possible buffer
overflow in case there was no END marker.

Signed-off-by: Tillmann Heidsieck <theidsieck@leenox.de>
---
 drivers/staging/wlan-ng/prism2fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index fe36613..d357b7e 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -590,7 +590,7 @@ static int mkpdrlist(struct pda *pda)
 
 	pda->nrec = 0;
 	curroff = 0;
-	while (curroff < (HFA384x_PDA_LEN_MAX / 2) &&
+	while (curroff < (HFA384x_PDA_LEN_MAX / 2 - 1) &&
 	       le16_to_cpu(pda16[curroff + 1]) != HFA384x_PDR_END_OF_PDA) {
 		pda->rec[pda->nrec] = (hfa384x_pdrec_t *) &(pda16[curroff]);
 
@@ -626,7 +626,7 @@ static int mkpdrlist(struct pda *pda)
 		curroff += le16_to_cpu(pda16[curroff]) + 1;
 
 	}
-	if (curroff >= (HFA384x_PDA_LEN_MAX / 2)) {
+	if (curroff >= (HFA384x_PDA_LEN_MAX / 2 - 1)) {
 		pr_err("no end record found or invalid lengths in PDR data, exiting. %x %d\n",
 		       curroff, pda->nrec);
 		return 1;
-- 
2.5.3

