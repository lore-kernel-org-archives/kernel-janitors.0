From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:51:32 +0000
Subject: [PATCH] msm_serial: Remove redundant unlikely()
Message-Id: <1291906292-669-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brown <davidb@codeaurora.org>, Daniel Walker <dwalker@codeaurora.org>, Bryan Huntsman <bryanh@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/serial/msm_serial.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/msm_serial.c b/drivers/serial/msm_serial.c
index f8c816e..8e43a7b 100644
--- a/drivers/serial/msm_serial.c
+++ b/drivers/serial/msm_serial.c
@@ -686,7 +686,7 @@ static int __init msm_serial_probe(struct platform_device *pdev)
 	msm_port = UART_TO_MSM(port);
 
 	msm_port->clk = clk_get(&pdev->dev, "uart_clk");
-	if (unlikely(IS_ERR(msm_port->clk)))
+	if (IS_ERR(msm_port->clk))
 		return PTR_ERR(msm_port->clk);
 	port->uartclk = clk_get_rate(msm_port->clk);
 	printk(KERN_INFO "uartclk = %d\n", port->uartclk);
-- 
1.7.0.4

