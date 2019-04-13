From: Colin King <colin.king@canonical.com>
Date: Sat, 13 Apr 2019 16:14:38 +0000
Subject: [PATCH] mwifiex: check for null return from skb_copy
Message-Id: <20190413161438.6376-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

It is possible for skb_copy to return a null pointer and currently
this will cause a null pointer dereference when the function
mwifiex_uap_queue_bridged_pkt is called.  Fix this by checking for
a null return from skb_copy and return -ENOMEM.

Addresses-Coverity: ("Dereference null return")
Fixes: 838e4f449297 ("mwifiex: improve uAP RX handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/marvell/mwifiex/uap_txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
index 5ce85d5727e4..b262dc78d638 100644
--- a/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
+++ b/drivers/net/wireless/marvell/mwifiex/uap_txrx.c
@@ -256,6 +256,8 @@ int mwifiex_handle_uap_rx_forward(struct mwifiex_private *priv,
 
 	if (is_multicast_ether_addr(ra)) {
 		skb_uap = skb_copy(skb, GFP_ATOMIC);
+		if (!skb_uap)
+			return -ENOMEM;
 		mwifiex_uap_queue_bridged_pkt(priv, skb_uap);
 	} else {
 		if (mwifiex_get_sta_entry(priv, ra)) {
-- 
2.20.1
