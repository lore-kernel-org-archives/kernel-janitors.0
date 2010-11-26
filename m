From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 26 Nov 2010 17:06:53 +0000
Subject: [PATCH] staging: msm: tvenc: fix error handling
Message-Id: <1290791215-21538-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Daniel Walker <dwalker@codeaurora.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Brown <davidb@codeaurora.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver init() function should return error code.
Also fix tvenc_clk leak.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Cannot compile this driver, so it is not tested at all.

 drivers/staging/msm/tvenc.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/msm/tvenc.c b/drivers/staging/msm/tvenc.c
index f41c5ac..4fbb77b 100644
--- a/drivers/staging/msm/tvenc.c
+++ b/drivers/staging/msm/tvenc.c
@@ -279,12 +279,13 @@ static int __init tvenc_driver_init(void)
 
 	if (IS_ERR(tvenc_clk)) {
 		printk(KERN_ERR "error: can't get tvenc_clk!\n");
-		return IS_ERR(tvenc_clk);
+		return PTR_ERR(tvenc_clk);
 	}
 
 	if (IS_ERR(tvdac_clk)) {
 		printk(KERN_ERR "error: can't get tvdac_clk!\n");
-		return IS_ERR(tvdac_clk);
+		clk_put(tvenc_clk);
+		return PTR_ERR(tvdac_clk);
 	}
 
 //	pm_qos_add_requirement(PM_QOS_SYSTEM_BUS_FREQ , "tvenc",
-- 
1.7.0.4

