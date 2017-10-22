From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 12:16:53 +0000
Subject: [PATCH] crypto-ccp: Use common error handling code in sp_get_irqs()
Message-Id: <0abcf065-56e9-dd3c-e210-0b0c21828a84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Gary Hook <gary.hook@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 14:10:33 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/crypto/ccp/sp-platform.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/ccp/sp-platform.c b/drivers/crypto/ccp/sp-platform.c
index 71734f254fd1..7d7670c7484a 100644
--- a/drivers/crypto/ccp/sp-platform.c
+++ b/drivers/crypto/ccp/sp-platform.c
@@ -78,25 +78,25 @@ static int sp_get_irqs(struct sp_device *sp)
 	sp_platform->irq_count = count;
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_notice(dev, "unable to get IRQ (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto report_failure;
 
 	sp->psp_irq = ret;
 	if (count = 1) {
 		sp->ccp_irq = ret;
 	} else {
 		ret = platform_get_irq(pdev, 1);
-		if (ret < 0) {
-			dev_notice(dev, "unable to get IRQ (%d)\n", ret);
-			return ret;
-		}
+		if (ret < 0)
+			goto report_failure;
 
 		sp->ccp_irq = ret;
 	}
 
 	return 0;
+
+report_failure:
+	dev_notice(dev, "unable to get IRQ (%d)\n", ret);
+	return ret;
 }
 
 static int sp_platform_probe(struct platform_device *pdev)
-- 
2.14.2

