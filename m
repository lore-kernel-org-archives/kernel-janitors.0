From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 Oct 2018 01:49:13 +0000
Subject: [PATCH net-next] net: cdc_ncm: remove set but not used variable 'ctx'
Message-Id: <1539308953-185007-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver@neukum.org>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_status':
drivers/net/usb/cdc_ncm.c:1603:22: warning:
 variable 'ctx' set but not used [-Wunused-but-set-variable]
  struct cdc_ncm_ctx *ctx;

It not used any more after
commit fa83dbeee558 ("net: cdc_ncm: remove redundant "disconnected" flag")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/usb/cdc_ncm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35a7d61..50c05d0f 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1600,11 +1600,8 @@ int cdc_ncm_rx_fixup(struct usbnet *dev, struct sk_buff *skb_in)
 
 static void cdc_ncm_status(struct usbnet *dev, struct urb *urb)
 {
-	struct cdc_ncm_ctx *ctx;
 	struct usb_cdc_notification *event;
 
-	ctx = (struct cdc_ncm_ctx *)dev->data[0];
-
 	if (urb->actual_length < sizeof(*event))
 		return;
