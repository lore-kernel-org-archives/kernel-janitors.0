From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Apr 2019 07:03:38 +0000
Subject: [PATCH] mwifiex: add a bounds check in mwifiex_process_sta_rx_packet()
Message-Id: <20190402070338.GB15171@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "local_rx_pd->priority" can't be trusted because
it comes from skb->data and it can go up to 255 instead of being capped
in the 0-7 range.  A few lines earlier, on the other side of the if
statement, we cap priority so it seems harmless to add a bounds check
here as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/marvell/mwifiex/sta_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_rx.c b/drivers/net/wireless/marvell/mwifiex/sta_rx.c
index fb28a5c7f441..52a2ce2e78b0 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_rx.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_rx.c
@@ -250,7 +250,8 @@ int mwifiex_process_sta_rx_packet(struct mwifiex_private *priv,
 							     local_rx_pd->nf);
 		}
 	} else {
-		if (rx_pkt_type != PKT_TYPE_BAR)
+		if (rx_pkt_type != PKT_TYPE_BAR &&
+		    local_rx_pd->priority < MAX_NUM_TID)
 			priv->rx_seq[local_rx_pd->priority] = seq_num;
 		memcpy(ta, priv->curr_bss_params.bss_descriptor.mac_address,
 		       ETH_ALEN);
-- 
2.17.1
