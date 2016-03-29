From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 29 Mar 2016 04:48:57 +0000
Subject: [PATCH 3/3] staging: dgnc: fix Logical continuations.
Message-Id: <20160329044857.GA23442@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix checkpatch.pl warning about
'Logical continuations should be on the previous line'

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 9412d25..3e490de 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -1811,9 +1811,9 @@ static void neo_vpd(struct dgnc_board *brd)
 	 * 0x10 : long resource name tage (PCI-66 files)
 	 * 0x7F : small resource end tag
 	 */
-	if  (((brd->vpd[0x08] != 0x82)
-		&&  (brd->vpd[0x10] != 0x82))
-		||  (brd->vpd[0x7F] != 0x78)) {
+	if  (((brd->vpd[0x08] != 0x82) &&
+	      (brd->vpd[0x10] != 0x82)) ||
+	     (brd->vpd[0x7F] != 0x78)) {
 
 		memset(brd->vpd, '\0', NEO_VPD_IMAGESIZE);
 	} else {
-- 
1.9.1

