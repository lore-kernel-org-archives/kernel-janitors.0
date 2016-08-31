From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Aug 2016 11:50:59 +0000
Subject: [PATCH] mwifiex: scan: Simplify code
Message-Id: <1472644259-15605-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akarwar@marvell.com, nishants@marvell.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This patch:
   - improves code layout
   - removes a useless memset(0) for some memory allocated with kzalloc
   - removes a useless if. We know that 'if (chan_band_tlv)' will succeed
     because it has been tested a few lines above

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index 21ec84794d0c..c29dd958acae 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2179,18 +2179,14 @@ int mwifiex_ret_802_11_scan(struct mwifiex_private *priv,
 
 		if (chan_band_tlv && adapter->nd_info) {
 			adapter->nd_info->matches[idx] -				kzalloc(sizeof(*pmatch) +
-				sizeof(u32), GFP_ATOMIC);
+				kzalloc(sizeof(*pmatch) + sizeof(u32),
+					GFP_ATOMIC);
 
 			pmatch = adapter->nd_info->matches[idx];
 
 			if (pmatch) {
-				memset(pmatch, 0, sizeof(*pmatch));
-				if (chan_band_tlv) {
-					pmatch->n_channels = 1;
-					pmatch->channels[0] -						chan_band->chan_number;
-				}
+				pmatch->n_channels = 1;
+				pmatch->channels[0] = chan_band->chan_number;
 			}
 		}
 
-- 
2.7.4

