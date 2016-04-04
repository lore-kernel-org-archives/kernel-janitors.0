From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 04 Apr 2016 09:52:30 +0000
Subject: [PATCH 2/2] staging: dgnc: remove blank line
Message-Id: <20160404095230.GA4421@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix checkpatch.pl warning:
Blank lines aren't necessary after an open brace '{'

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_neo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
index 2da6a72..3b8ce38 100644
--- a/drivers/staging/dgnc/dgnc_neo.c
+++ b/drivers/staging/dgnc/dgnc_neo.c
@@ -1794,7 +1794,6 @@ static void neo_vpd(struct dgnc_board *brd)
 	if  (((brd->vpd[0x08] != 0x82) &&
 	      (brd->vpd[0x10] != 0x82)) ||
 	     (brd->vpd[0x7F] != 0x78)) {
-
 		memset(brd->vpd, '\0', NEO_VPD_IMAGESIZE);
 	} else {
 		/* Search for the serial number */
-- 
1.9.1

