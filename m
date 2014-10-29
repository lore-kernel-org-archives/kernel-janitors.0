From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 16:11:18 +0000
Subject: [patch] mfd: wm8350: fix a printk
Message-Id: <20141029161118.GG5290@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a precedence bug here because >> has higher precedence than &
so we end up printing the wrong mode.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/wm8350-core.c b/drivers/mfd/wm8350-core.c
index 4ab527f..f5124a8 100644
--- a/drivers/mfd/wm8350-core.c
+++ b/drivers/mfd/wm8350-core.c
@@ -308,7 +308,7 @@ int wm8350_device_init(struct wm8350 *wm8350, int irq,
 		goto err;
 	}
 
-	mode = id2 & WM8350_CONF_STS_MASK >> 10;
+	mode = (id2 & WM8350_CONF_STS_MASK) >> 10;
 	cust_id = id2 & WM8350_CUST_ID_MASK;
 	chip_rev = (id2 & WM8350_CHIP_REV_MASK) >> 12;
 	dev_info(wm8350->dev,
