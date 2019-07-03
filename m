From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 03 Jul 2019 05:59:08 +0000
Subject: [PATCH -next] serial: 8250: 8250_core: Fix missing unlock on error in serial8250_register_8250_port(
Message-Id: <20190703055908.141294-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add the missing unlock before return from function serial8250_register_8250_port()
in the error handling case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/tty/serial/8250/8250_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index a4470771005f..df3bcc0b2d74 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -1026,8 +1026,10 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
 		if (!has_acpi_companion(uart->port.dev)) {
 			gpios = mctrl_gpio_init(&uart->port, 0);
 			if (IS_ERR(gpios)) {
-				if (PTR_ERR(gpios) != -ENOSYS)
-					return PTR_ERR(gpios);
+				if (PTR_ERR(gpios) != -ENOSYS) {
+					ret = PTR_ERR(gpios);
+					goto out_unlock;
+				}
 			} else {
 				uart->gpios = gpios;
 			}
@@ -1099,6 +1101,7 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
 		}
 	}
 
+out_unlock:
 	mutex_unlock(&serial_mutex);
 
 	return ret;
