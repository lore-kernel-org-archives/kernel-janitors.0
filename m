From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sun, 18 Oct 2020 05:49:12 +0000
Subject: [PATCH] hw_random : platform_get_irq() already prints an error
Message-Id: <20201018054912.GA76941@fedora-thirty-three>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

coccicheck
drivers/char//hw_random/imx-rngc.c:256:2-9: line 256 is redundant because platform_get_irq() already prints an error

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/char/hw_random/imx-rngc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 61c844baf26e..69f13ff1bbec 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -253,7 +253,6 @@ static int imx_rngc_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq <= 0) {
-		dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
 		return irq;
 	}
 
-- 
2.28.0
