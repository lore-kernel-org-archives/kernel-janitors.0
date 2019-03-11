From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 11 Mar 2019 09:51:15 +0000
Subject: [PATCH v2] serial: sh-sci: Missing uart_unregister_driver() on error in sci_probe_single()
Message-Id: <20190311095115.156774-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jslaby@suse.com, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dan.carpenter@oracle.com

Add the missing uart_unregister_driver() before return
from sci_probe_single() in the error handling case.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v1->v2: add uart_unregister_driver() if mctrl_gpio_init is failed.
 drivers/tty/serial/sh-sci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 64bbeb7d7e0c..fb5034390795 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3254,12 +3254,16 @@ static int sci_probe_single(struct platform_device *dev,
 	mutex_unlock(&sci_uart_registration_lock);
 
 	ret = sci_init_single(dev, sciport, index, p, false);
-	if (ret)
+	if (ret) {
+		uart_unregister_driver(&sci_uart_driver);
 		return ret;
+	}
 
 	sciport->gpios = mctrl_gpio_init(&sciport->port, 0);
-	if (IS_ERR(sciport->gpios) && PTR_ERR(sciport->gpios) != -ENOSYS)
+	if (IS_ERR(sciport->gpios) && PTR_ERR(sciport->gpios) != -ENOSYS) {
+		uart_unregister_driver(&sci_uart_driver);
 		return PTR_ERR(sciport->gpios);
+	}
 
 	if (sciport->has_rtscts) {
 		if (!IS_ERR_OR_NULL(mctrl_gpio_to_gpiod(sciport->gpios,
-- 
2.20.1
