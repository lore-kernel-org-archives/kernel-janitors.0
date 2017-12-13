From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 14:25:51 +0000
Subject: [PATCH] staging: vt6656: Delete an error message for a failed memory allocation in vnt_alloc_bufs()
Message-Id: <d05afbfa-54c9-2783-fd1e-df89991927f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Chewie Lin <linsh@oregonstate.edu>, Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Malcolm Priestley <tvboxspy@gmail.com>, Scott Matheina <scott@matheina.com>, =?UTF-8?Q?Simon_Sandstr=c3=b6m?= <simon@nikanor.nu>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Dec 2017 15:15:45 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/vt6656/main_usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index cc6d8778fe5b..554b21e40298 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -437,11 +437,8 @@ static bool vnt_alloc_bufs(struct vnt_private *priv)
 
 	for (ii = 0; ii < priv->num_rcb; ii++) {
 		priv->rcb[ii] = kzalloc(sizeof(*priv->rcb[ii]), GFP_KERNEL);
-		if (!priv->rcb[ii]) {
-			dev_err(&priv->usb->dev,
-				"failed to allocate rcb no %d\n", ii);
+		if (!priv->rcb[ii])
 			goto free_rx_tx;
-		}
 
 		rcb = priv->rcb[ii];
 
-- 
2.15.1

