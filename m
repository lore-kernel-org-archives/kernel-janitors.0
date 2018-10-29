From: Colin King <colin.king@canonical.com>
Date: Mon, 29 Oct 2018 22:49:45 +0000
Subject: [PATCH] USB: gadget: udc: fix spelling mistake "intrerrupt" -> "interrupt"
Message-Id: <20181029224945.20165-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in comment

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index afaea11ec771..55c8c8abeacd 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1330,7 +1330,7 @@ static void pch_vbus_gpio_work_rise(struct work_struct *irq_work)
 }
 
 /**
- * pch_vbus_gpio_irq() - IRQ handler for GPIO intrerrupt for changing VBUS
+ * pch_vbus_gpio_irq() - IRQ handler for GPIO interrupt for changing VBUS
  * @irq:	Interrupt request number
  * @dev:	Reference to the device structure
  *
-- 
2.19.1
