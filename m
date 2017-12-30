From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:07:05 +0000
Subject: [PATCH 1/2] at76c50x-usb: Delete an error message for a failed memory allocation in at76_submit_rx_u
Message-Id: <c50358b4-79e2-0861-9087-99104944a0b8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1d76fe59-af15-ba4d-e05d-09dcd9ee38cd@users.sourceforge.net>
In-Reply-To: <1d76fe59-af15-ba4d-e05d-09dcd9ee38cd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Andrew Zaborowski <andrew.zaborowski@intel.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kalle Valo <kvalo@codeaurora.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 30 Dec 2017 21:50:12 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/atmel/at76c50x-usb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/atmel/at76c50x-usb.c b/drivers/net/wireless/atmel/at76c50x-usb.c
index ede89d4ffc88..2893d339b440 100644
--- a/drivers/net/wireless/atmel/at76c50x-usb.c
+++ b/drivers/net/wireless/atmel/at76c50x-usb.c
@@ -1223,8 +1223,6 @@ static int at76_submit_rx_urb(struct at76_priv *priv)
 	if (!skb) {
 		skb = dev_alloc_skb(sizeof(struct at76_rx_buffer));
 		if (!skb) {
-			wiphy_err(priv->hw->wiphy,
-				  "cannot allocate rx skbuff\n");
 			ret = -ENOMEM;
 			goto exit;
 		}
-- 
2.15.1

