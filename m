From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 12:05:51 +0000
Subject: [PATCH] mt76: mt7915: fix locking bug in mt7915_sta_rc_update()
Message-Id: <20200520120551.GG172354@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, YF Luo <yf.luo@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Yiwei Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Shayne Chen <shayne.chen@mediatek.com>

This function calls rcu_read_lock() twice instead of unlocking.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 98567374c2c9..3f00f5439c7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -790,7 +790,7 @@ mt7915_sta_rc_update(struct ieee80211_hw *hw,
 		rcu_read_unlock();
 		return;
 	}
-	rcu_read_lock();
+	rcu_read_unlock();
 
 	set_bit(changed, &msta->stats.changed);
 	ieee80211_queue_work(hw, &msta->stats_work);
-- 
2.26.2
