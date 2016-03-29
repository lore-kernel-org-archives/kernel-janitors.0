From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 29 Mar 2016 04:48:31 +0000
Subject: [PATCH 2/3] staging: dgnc: fix 'line over 80 characters'
Message-Id: <20160329044831.GA23068@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix checkpatch.pl warning about 'line over 80 characters'.
I just moved all line comment to above if statement.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index c3bb1b4..9412d25 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -1805,9 +1805,15 @@ static void neo_vpd(struct dgnc_board *brd)
 		brd->vpd[(i * 2) + 1] = (a >> 8) & 0xff;
 	}
 
-	if  (((brd->vpd[0x08] != 0x82)	   /* long resource name tag */
-		&&  (brd->vpd[0x10] != 0x82))   /* long resource name tag (PCI-66 files)*/
-		||  (brd->vpd[0x7F] != 0x78)) { /* small resource end tag */
+	/*
+	 * brd->vpd has different name tags by below index.
+	 * 0x08 : long resource name tag
+	 * 0x10 : long resource name tage (PCI-66 files)
+	 * 0x7F : small resource end tag
+	 */
+	if  (((brd->vpd[0x08] != 0x82)
+		&&  (brd->vpd[0x10] != 0x82))
+		||  (brd->vpd[0x7F] != 0x78)) {
 
 		memset(brd->vpd, '\0', NEO_VPD_IMAGESIZE);
 	} else {
-- 
1.9.1

