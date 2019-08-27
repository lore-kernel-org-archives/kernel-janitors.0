From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 27 Aug 2019 11:46:14 +0000
Subject: [PATCH -next] tty: serial: linflexuart: Use DEFINE_SPINLOCK() for spinlock
Message-Id: <20190827114614.102037-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/tty/serial/fsl_linflexuart.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/tty/serial/fsl_linflexuart.c b/drivers/tty/serial/fsl_linflexuart.c
index 26b9601a0952..8aea7822b731 100644
--- a/drivers/tty/serial/fsl_linflexuart.c
+++ b/drivers/tty/serial/fsl_linflexuart.c
@@ -136,7 +136,7 @@ MODULE_DEVICE_TABLE(of, linflex_dt_ids);
 #ifdef CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE
 static struct uart_port *earlycon_port;
 static bool linflex_earlycon_same_instance;
-static spinlock_t init_lock;
+static DEFINE_SPINLOCK(init_lock);
 static bool during_init;
 
 static struct {
@@ -922,10 +922,6 @@ static int __init linflex_serial_init(void)
 	if (ret)
 		uart_unregister_driver(&linflex_reg);
 
-#ifdef CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE
-	spin_lock_init(&init_lock);
-#endif
-
 	return ret;
 }
