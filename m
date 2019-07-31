From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 22:39:17 +0000
Subject: [PATCH] usb: musb: remove redundant assignment to variable ret
Message-Id: <20190731223917.16532-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being initialized with a value that is never read
and ret is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 9f5a4819a744..2bc55e0ceace 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -1721,7 +1721,7 @@ mode_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct musb *musb = dev_to_musb(dev);
 	unsigned long flags;
-	int ret = -EINVAL;
+	int ret;
 
 	spin_lock_irqsave(&musb->lock, flags);
 	ret = sprintf(buf, "%s\n", usb_otg_state_string(musb->xceiv->otg->state));
-- 
2.20.1
