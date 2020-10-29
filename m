From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Thu, 29 Oct 2020 00:52:17 +0000
Subject: [PATCH resend] hwrng: imx-rngc - irq already prints an error
Message-Id: <20201029005217.GA28008@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com, martin@kaiser.cx
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, linux-crypto@vger.kernel.org, prasannatsmkumar@gmail.com, m.felsch@pengutronix.de, kernel-janitors@vger.kernel.org

Clean up the check for irq. dev_err() is superfluous as
platform_get_irq() already prints an error. Check for zero
would indicate a bug. Remove curly braces to conform to
styling requirements.
Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/char/hw_random/imx-rngc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 61c844baf26e..b05d676ca814 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -252,10 +252,8 @@ static int imx_rngc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = clk_prepare_enable(rngc->clk);
 	if (ret)
-- 
2.28.0
