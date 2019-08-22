From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 08:30:47 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_net/wireless=3a_Delete_unnecessary_checks_bef?= =?UTF-8?B?b3JlIHRoZSBtYWNybyBj
Message-Id: <ea6c6fef-9868-196b-d914-23faf12d7f5c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roy Luo <royluo@google.com>, Ryder Lee <ryder.lee@mediatek.com>, Solomon Peachy <pizza@shaftnet.org>, Stanislaw Gruszka <sgruszka@redhat.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 10:20:10 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/ath/ath10k/wmi.c               | 4 +---
 drivers/net/wireless/intel/iwlegacy/3945-mac.c      | 8 ++------
 drivers/net/wireless/intel/iwlegacy/common.c        | 8 ++------
 drivers/net/wireless/mediatek/mt76/mt76x02_beacon.c | 5 +----
 drivers/net/wireless/st/cw1200/scan.c               | 3 +--
 5 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4f707c6394bb..d384293429b4 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -9440,7 +9440,5 @@ void ath10k_wmi_detach(struct ath10k *ar)
 	}

 	cancel_work_sync(&ar->svc_rdy_work);
-
-	if (ar->svc_rdy_skb)
-		dev_kfree_skb(ar->svc_rdy_skb);
+	dev_kfree_skb(ar->svc_rdy_skb);
 }
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index b82da75a9ae3..4b3b166f6f2a 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -2302,9 +2302,7 @@ __il3945_down(struct il_priv *il)
 	il3945_hw_txq_ctx_free(il);
 exit:
 	memset(&il->card_alive, 0, sizeof(struct il_alive_resp));
-
-	if (il->beacon_skb)
-		dev_kfree_skb(il->beacon_skb);
+	dev_kfree_skb(il->beacon_skb);
 	il->beacon_skb = NULL;

 	/* clear out any free frames */
@@ -3847,9 +3845,7 @@ il3945_pci_remove(struct pci_dev *pdev)
 	il_free_channel_map(il);
 	il_free_geos(il);
 	kfree(il->scan_cmd);
-	if (il->beacon_skb)
-		dev_kfree_skb(il->beacon_skb);
-
+	dev_kfree_skb(il->beacon_skb);
 	ieee80211_free_hw(il->hw);
 }

diff --git a/drivers/net/wireless/intel/iwlegacy/common.c b/drivers/net/wireless/intel/iwlegacy/common.c
index 73f7bbf742bc..4e7e64f46ea8 100644
--- a/drivers/net/wireless/intel/iwlegacy/common.c
+++ b/drivers/net/wireless/intel/iwlegacy/common.c
@@ -5182,8 +5182,7 @@ il_mac_reset_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	memset(&il->current_ht_config, 0, sizeof(struct il_ht_config));

 	/* new association get rid of ibss beacon skb */
-	if (il->beacon_skb)
-		dev_kfree_skb(il->beacon_skb);
+	dev_kfree_skb(il->beacon_skb);
 	il->beacon_skb = NULL;
 	il->timestamp = 0;

@@ -5302,10 +5301,7 @@ il_beacon_update(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	}

 	spin_lock_irqsave(&il->lock, flags);
-
-	if (il->beacon_skb)
-		dev_kfree_skb(il->beacon_skb);
-
+	dev_kfree_skb(il->beacon_skb);
 	il->beacon_skb = skb;

 	timestamp = ((struct ieee80211_mgmt *)skb->data)->u.beacon.timestamp;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_beacon.c b/drivers/net/wireless/mediatek/mt76/mt76x02_beacon.c
index d61c686e08de..d6487cd67cca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_beacon.c
@@ -88,10 +88,7 @@ int mt76x02_mac_set_beacon(struct mt76x02_dev *dev, u8 vif_idx,
 	for (i = 0; i < ARRAY_SIZE(dev->beacons); i++) {
 		if (vif_idx == i) {
 			force_update = !!dev->beacons[i] ^ !!skb;
-
-			if (dev->beacons[i])
-				dev_kfree_skb(dev->beacons[i]);
-
+			dev_kfree_skb(dev->beacons[i]);
 			dev->beacons[i] = skb;
 			__mt76x02_mac_set_beacon(dev, bcn_idx, skb);
 		} else if (force_update && dev->beacons[i]) {
diff --git a/drivers/net/wireless/st/cw1200/scan.c b/drivers/net/wireless/st/cw1200/scan.c
index c46b044b7f7b..988581cc134b 100644
--- a/drivers/net/wireless/st/cw1200/scan.c
+++ b/drivers/net/wireless/st/cw1200/scan.c
@@ -120,8 +120,7 @@ int cw1200_hw_scan(struct ieee80211_hw *hw,
 		++priv->scan.n_ssids;
 	}

-	if (frame.skb)
-		dev_kfree_skb(frame.skb);
+	dev_kfree_skb(frame.skb);
 	mutex_unlock(&priv->conf_mutex);
 	queue_work(priv->workqueue, &priv->scan.work);
 	return 0;
--
2.23.0
