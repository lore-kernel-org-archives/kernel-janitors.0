From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 13:15:22 +0000
Subject: [PATCH] USB: imx21-hcd: Delete an error message for a failed memory allocation in activate_etd()
Message-Id: <72f18353-9c48-d64d-c860-7ee776b021b7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Dec 2017 13:23:35 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/imx21-hcd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/imx21-hcd.c b/drivers/usb/host/imx21-hcd.c
index 3a8bbfe43a8e..2f3d60b07aea 100644
--- a/drivers/usb/host/imx21-hcd.c
+++ b/drivers/usb/host/imx21-hcd.c
@@ -281,10 +281,8 @@ static void activate_etd(struct imx21 *imx21, int etd_num, u8 dir)
 								etd->len,
 								GFP_ATOMIC);
 			}
-			if (!etd->bounce_buffer) {
-				dev_err(imx21->dev, "failed bounce alloc\n");
+			if (!etd->bounce_buffer)
 				goto err_bounce_alloc;
-			}
 
 			etd->dma_handle  				dma_map_single(imx21->dev,
-- 
2.15.1

