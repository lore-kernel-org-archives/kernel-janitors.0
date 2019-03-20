From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 20 Mar 2019 02:25:31 +0000
Subject: [PATCH serial v4] sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
Message-Id: <20190320022531.189437-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add the missing uart_unregister_driver() and i2c_del_driver() before
return from sc16is7xx_init() in the error handling case.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Reviewed-by: Dan Carpeter <dan.carpenter@oracle.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2: fix compile warning if CONFIG_SERIAL_SC16IS7XX_SPI is not exist.
 v2->v3: create functions for i2c and spi to do error handling as dan carpenter suggestion.
 v3->v4: As Greg suggestion, v4 is based on v1 and v3. 
 drivers/tty/serial/sc16is7xx.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7xx.c
index 09a183dfc526..810ad89d2fb8 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1434,6 +1434,19 @@ static struct spi_driver sc16is7xx_spi_uart_driver = {
 };
 
 MODULE_ALIAS("spi:sc16is7xx");
+
+static int __init register_sc16is7xx_spi(void)
+{
+	return spi_register_driver(&sc16is7xx_spi_uart_driver);
+}
+
+static void __exit unregister_sc16is7xx_spi(void)
+{
+	spi_unregister_driver(&sc16is7xx_spi_uart_driver);
+}
+#else
+static int __init register_sc16is7xx_spi(void) { return 0; }
+static void __exit unregister_sc16is7xx_spi(void) {}
 #endif
 
 #ifdef CONFIG_SERIAL_SC16IS7XX_I2C
@@ -1491,6 +1504,18 @@ static struct i2c_driver sc16is7xx_i2c_uart_driver = {
 	.id_table	= sc16is7xx_i2c_id_table,
 };
 
+static int __init register_sc16is7xx_i2c(void)
+{
+	return i2c_add_driver(&sc16is7xx_i2c_uart_driver);
+}
+
+static void __exit del_sc16is7xx_i2c(void)
+{
+	i2c_del_driver(&sc16is7xx_i2c_uart_driver);
+}
+#else
+static int __init register_sc16is7xx_i2c(void) { return 0; }
+static void __exit del_sc16is7xx_i2c(void) {}
 #endif
 
 static int __init sc16is7xx_init(void)
@@ -1503,27 +1528,21 @@ static int __init sc16is7xx_init(void)
 		return ret;
 	}
 
-#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
-	ret = i2c_add_driver(&sc16is7xx_i2c_uart_driver);
+	ret = register_sc16is7xx_i2c();
 	if (ret < 0) {
 		pr_err("failed to init sc16is7xx i2c --> %d\n", ret);
 		goto err_i2c;
 	}
-#endif
 
-#ifdef CONFIG_SERIAL_SC16IS7XX_SPI
-	ret = spi_register_driver(&sc16is7xx_spi_uart_driver);
+	ret = register_sc16is7xx_spi();
 	if (ret < 0) {
 		pr_err("failed to init sc16is7xx spi --> %d\n", ret);
 		goto err_spi;
 	}
-#endif
 	return ret;
 
 err_spi:
-#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
-	i2c_del_driver(&sc16is7xx_i2c_uart_driver);
-#endif
+	del_sc16is7xx_i2c();
 err_i2c:
 	uart_unregister_driver(&sc16is7xx_uart);
 	return ret;
@@ -1532,13 +1551,8 @@ module_init(sc16is7xx_init);
 
 static void __exit sc16is7xx_exit(void)
 {
-#ifdef CONFIG_SERIAL_SC16IS7XX_I2C
-	i2c_del_driver(&sc16is7xx_i2c_uart_driver);
-#endif
-
-#ifdef CONFIG_SERIAL_SC16IS7XX_SPI
-	spi_unregister_driver(&sc16is7xx_spi_uart_driver);
-#endif
+	del_sc16is7xx_i2c();
+	unregister_sc16is7xx_spi();
 	uart_unregister_driver(&sc16is7xx_uart);
 }
 module_exit(sc16is7xx_exit);
-- 
2.20.1
