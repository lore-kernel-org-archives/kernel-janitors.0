From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 Jan 2011 15:49:07 +0000
Subject: [PATCH 2/2] drivers/staging/msm/lcdc.c: Convert IS_ERR result to PTR_ERR
Message-Id: <1296143347-17508-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, Daniel Walker <dwalker@codeaurora.org>, Stepan Moskovchenko <stepanm@codeaurora.org>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Brown <davidb@codeaurora.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This code elsewhere returns a negative constant to an indicate an error,
while IS_ERR returns the result of a >= operation.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x;
@@

 if (...) { ...
- return IS_ERR(x);
+ return PTR_ERR(x);
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/msm/lcdc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/msm/lcdc.c b/drivers/staging/msm/lcdc.c
--- a/drivers/staging/msm/lcdc.c
+++ b/drivers/staging/msm/lcdc.c
@@ -224,12 +224,12 @@ static int __init lcdc_driver_init(void)
 	mdp_lcdc_pclk_clk = clk_get(NULL, "mdp_lcdc_pclk_clk");
 	if (IS_ERR(mdp_lcdc_pclk_clk)) {
 		printk(KERN_ERR "error: can't get mdp_lcdc_pclk_clk!\n");
-		return IS_ERR(mdp_lcdc_pclk_clk);
+		return PTR_ERR(mdp_lcdc_pclk_clk);
 	}
 	mdp_lcdc_pad_pclk_clk = clk_get(NULL, "mdp_lcdc_pad_pclk_clk");
 	if (IS_ERR(mdp_lcdc_pad_pclk_clk)) {
 		printk(KERN_ERR "error: can't get mdp_lcdc_pad_pclk_clk!\n");
-		return IS_ERR(mdp_lcdc_pad_pclk_clk);
+		return PTR_ERR(mdp_lcdc_pad_pclk_clk);
 	}
 //	pm_qos_add_requirement(PM_QOS_SYSTEM_BUS_FREQ , "lcdc",
 //				PM_QOS_DEFAULT_VALUE);

