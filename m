From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 22 Nov 2020 17:03:42 +0000
Subject: [PATCH 1/2] ath10k: Fix an error handling path
Message-Id: <20201122170342.1346011-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, erik.stromdahl@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'ath10k_usb_create()' fails, we should release some resources and report
an error instead of silently continuing.

Fixes: 4db66499df91 ("ath10k: add initial USB support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/ath/ath10k/usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 05a620ff6fe2..0b47c3a09794 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -997,6 +997,8 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 
 	ar_usb = ath10k_usb_priv(ar);
 	ret = ath10k_usb_create(ar, interface);
+	if (ret)
+		goto err;
 	ar_usb->ar = ar;
 
 	ar->dev_id = product_id;
-- 
2.27.0
