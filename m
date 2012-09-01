From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Sep 2012 16:33:09 +0000
Subject: [PATCH 2/4] drivers/tty/serial/sirfsoc_uart.c: drop frees of devm_ alloc'd data
Message-Id: <1346517191-8794-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm free functions should not have to be explicitly used.

A semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

(
* devm_kfree(...);
|
* devm_free_irq(...);
|
* devm_iounmap(...);
|
* devm_release_region(...);
|
* devm_release_mem_region(...);
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
diff --git a/drivers/tty/serial/sirfsoc_uart.c b/drivers/tty/serial/sirfsoc_uart.c
index 5b3eda2..a9e2bd1 100644
--- a/drivers/tty/serial/sirfsoc_uart.c
+++ b/drivers/tty/serial/sirfsoc_uart.c
@@ -668,7 +668,7 @@ int sirfsoc_uart_probe(struct platform_device *pdev)
 	if (res = NULL) {
 		dev_err(&pdev->dev, "Insufficient resources.\n");
 		ret = -EFAULT;
-		goto irq_err;
+		goto err;
 	}
 	port->irq = res->start;
 
@@ -676,7 +676,7 @@ int sirfsoc_uart_probe(struct platform_device *pdev)
 		sirfport->p = pinctrl_get_select_default(&pdev->dev);
 		ret = IS_ERR(sirfport->p);
 		if (ret)
-			goto pin_err;
+			goto err;
 	}
 
 	port->ops = &sirfsoc_uart_ops;
@@ -695,9 +695,6 @@ port_err:
 	platform_set_drvdata(pdev, NULL);
 	if (sirfport->hw_flow_ctrl)
 		pinctrl_put(sirfport->p);
-pin_err:
-irq_err:
-	devm_iounmap(&pdev->dev, port->membase);
 err:
 	return ret;
 }
@@ -709,7 +706,6 @@ static int sirfsoc_uart_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 	if (sirfport->hw_flow_ctrl)
 		pinctrl_put(sirfport->p);
-	devm_iounmap(&pdev->dev, port->membase);
 	uart_remove_one_port(&sirfsoc_uart_drv, port);
 	return 0;
 }
