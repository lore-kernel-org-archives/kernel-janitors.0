From: Colin King <colin.king@canonical.com>
Date: Tue, 19 May 2020 22:48:20 +0000
Subject: [PATCH] mt76: mt7915: fix a handful of spelling mistakes
Message-Id: <20200519224820.6391-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some spelling mistakes in some literal strings. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index ee0066fedd04..5278bee812f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -173,14 +173,14 @@ mt7915_txbf_stat_read_phy(struct mt7915_phy *phy, struct seq_file *s)
 
 	/* Tx Beamformee Rx NDPA & Tx feedback report */
 	cnt = mt76_rr(dev, MT_ETBF_TX_NDP_BFRP(ext_phy));
-	seq_printf(s, "Tx Beamformee sucessful feedback frames: %ld\n",
+	seq_printf(s, "Tx Beamformee successful feedback frames: %ld\n",
 		   FIELD_GET(MT_ETBF_TX_FB_CPL, cnt));
-	seq_printf(s, "Tx Beamformee feedback triggerd counts: %ld\n",
+	seq_printf(s, "Tx Beamformee feedback triggered counts: %ld\n",
 		   FIELD_GET(MT_ETBF_TX_FB_TRI, cnt));
 
 	/* Tx SU counters */
 	cnt = mt76_rr(dev, MT_MIB_DR11(ext_phy));
-	seq_printf(s, "Tx single-user sucessful MPDU counts: %d\n", cnt);
+	seq_printf(s, "Tx single-user successful MPDU counts: %d\n", cnt);
 
 	seq_puts(s, "\n");
 }
-- 
2.25.1
