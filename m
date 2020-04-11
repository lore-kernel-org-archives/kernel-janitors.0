From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 06:56:21 +0000
Subject: [PATCH] usb: gadget: max3420: Add a missing '\n' in a log message
Message-Id: <20200411065621.7744-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org, jaswinder.singh@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/max3420_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index 8fbc083b6732..23f33946d80c 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -901,7 +901,7 @@ static int max3420_thread(void *dev_id)
 	}
 
 	set_current_state(TASK_RUNNING);
-	dev_info(udc->dev, "SPI thread exiting");
+	dev_info(udc->dev, "SPI thread exiting\n");
 	return 0;
 }
 
-- 
2.20.1
