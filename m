From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 21:06:30 +0000
Subject: [PATCH] mfd/htc-i2cpld: Delete an error message for a failed memory allocation in htcpld_setup_chips
Message-Id: <b957af3a-b637-bbbf-9f08-00744fca1b51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 22:02:16 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/htc-i2cpld.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index 3f9eee5f8fb9..4bf8b7781c77 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -479,10 +479,8 @@ static int htcpld_setup_chips(struct platform_device *pdev)
 	htcpld->nchips = pdata->num_chip;
 	htcpld->chip = devm_kzalloc(dev, sizeof(struct htcpld_chip) * htcpld->nchips,
 				    GFP_KERNEL);
-	if (!htcpld->chip) {
-		dev_warn(dev, "Unable to allocate memory for chips\n");
+	if (!htcpld->chip)
 		return -ENOMEM;
-	}
 
 	/* Add the chips as best we can */
 	for (i = 0; i < htcpld->nchips; i++) {
-- 
2.15.1

