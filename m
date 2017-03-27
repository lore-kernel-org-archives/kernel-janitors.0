From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 27 Mar 2017 08:52:20 +0000
Subject: [PATCH] staging: atomisp: fix an issue timeout value for checking error
Message-Id: <20170327085220.GA26407@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org, daeseok.youn@gmail.com, alan@linux.intel.com, dan.carpenter@oracle.com, singhalsimran0@gmail.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The timeout variable could be zero even if the bits has expected result.
The checking expected bits again would be better instead whether
the timeout value is zero or not.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index 94bc793..f2e5749 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -220,11 +220,11 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
 			timeout--;
 		}
 
-		if (timeout != 0)
+		if (!(isp_sspm1 & ISP_FREQ_VALID_MASK))
 			break;
 	}
 
-	if (timeout = 0) {
+	if (isp_sspm1 & ISP_FREQ_VALID_MASK) {
 		dev_err(isp->dev, "DFS failed due to HW error.\n");
 		return -EINVAL;
 	}
@@ -238,7 +238,7 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
 		udelay(100);
 		timeout--;
 	}
-	if (timeout = 0) {
+	if ((isp_sspm1 >> ISP_FREQ_STAT_OFFSET) != ratio) {
 		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
 		return -EINVAL;
 	}
-- 
1.9.1

