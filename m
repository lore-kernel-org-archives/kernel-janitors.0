From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 01 Nov 2019 11:19:50 +0000
Subject: [PATCH -next] serial: uartlite: Missing uart_unregister_driver() on error in ulite_probe()
Message-Id: <20191101111950.47817-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jacmet@sunsite.dk, gregkh@linuxfoundation.org, jslaby@suse.com, shubhrajyoti.datta@xilinx.com
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If uart_register_driver(&ulite_uart_driver) is success,
but followed function is failed in ulite_probe, it needs to call
uart_unregister_driver to unregister.

Fixes: f33cf776617b ("serial-uartlite: Move the uart register")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/tty/serial/uartlite.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
index 06e79c1..2edae76 100644
--- a/drivers/tty/serial/uartlite.c
+++ b/drivers/tty/serial/uartlite.c
@@ -813,21 +813,29 @@ static int ulite_probe(struct platform_device *pdev)
 
 	pdata = devm_kzalloc(&pdev->dev, sizeof(struct uartlite_data),
 			     GFP_KERNEL);
-	if (!pdata)
+	if (!pdata) {
+		uart_unregister_driver(&ulite_uart_driver);
 		return -ENOMEM;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
+	if (!res) {
+		uart_unregister_driver(&ulite_uart_driver);
 		return -ENODEV;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
+	if (irq <= 0) {
+		uart_unregister_driver(&ulite_uart_driver);
 		return -ENXIO;
+	}
 
 	pdata->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
 	if (IS_ERR(pdata->clk)) {
-		if (PTR_ERR(pdata->clk) != -ENOENT)
+		if (PTR_ERR(pdata->clk) != -ENOENT) {
+			uart_unregister_driver(&ulite_uart_driver);
 			return PTR_ERR(pdata->clk);
+		}
 
 		/*
 		 * Clock framework support is optional, continue on
@@ -840,6 +848,7 @@ static int ulite_probe(struct platform_device *pdev)
 	ret = clk_prepare_enable(pdata->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clock\n");
+		uart_unregister_driver(&ulite_uart_driver);
 		return ret;
 	}
 
-- 
2.7.4
