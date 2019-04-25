From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 25 Apr 2019 15:10:44 +0000
Subject: [PATCH -next] serial: milbeaut_usio: Fix error handling in probe and remove
Message-Id: <20190425151044.105045-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

devm_clk_get() is used so there is no reason to explicitly call
clk_put() in probe or remove functions. Also remove duplicate assign
for port->membase.

Fixes: ba44dc043004 ("serial: Add Milbeaut serial control")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/tty/serial/milbeaut_usio.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/tty/serial/milbeaut_usio.c b/drivers/tty/serial/milbeaut_usio.c
index d303b7d4bb20..b960d531300c 100644
--- a/drivers/tty/serial/milbeaut_usio.c
+++ b/drivers/tty/serial/milbeaut_usio.c
@@ -525,8 +525,6 @@ static int mlb_usio_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto failed;
 	}
-	port->mapbase = res->start;
-	port->membase = ioremap(res->start, (res->end - res->start + 1));
 	port->membase = devm_ioremap(&pdev->dev, res->start,
 				resource_size(res));
 
@@ -548,16 +546,12 @@ static int mlb_usio_probe(struct platform_device *pdev)
 	ret = uart_add_one_port(&mlb_usio_uart_driver, port);
 	if (ret) {
 		dev_err(&pdev->dev, "Adding port failed: %d\n", ret);
-		goto failed1;
+		goto failed;
 	}
 	return 0;
 
-failed1:
-	iounmap(port->membase);
-
 failed:
 	clk_disable_unprepare(clk);
-	clk_put(clk);
 
 	return ret;
 }
@@ -569,7 +563,6 @@ static int mlb_usio_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&mlb_usio_uart_driver, port);
 	clk_disable_unprepare(clk);
-	clk_put(clk);
 
 	return 0;
 }
