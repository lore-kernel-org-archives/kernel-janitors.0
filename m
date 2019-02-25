From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 25 Feb 2019 03:32:46 +0000
Subject: [PATCH] ath9k: remove set but not used variable 'acq'
Message-Id: <20190225033246.127410-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/ath/ath9k/recv.c: In function 'ath_rx_count_airtime':
drivers/net/wireless/ath/ath9k/recv.c:1010:18: warning:
 variable 'acq' set but not used [-Wunused-but-set-variable]

It's not used after 89cea7493a34 ("ath9k: Switch to mac80211 TXQ scheduling
and airtime APIs"). Also remove related variables.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/ath/ath9k/recv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/recv.c b/drivers/net/wireless/ath/ath9k/recv.c
index 285a62d3019d..4e97f7f3b2a3 100644
--- a/drivers/net/wireless/ath/ath9k/recv.c
+++ b/drivers/net/wireless/ath/ath9k/recv.c
@@ -1006,9 +1006,6 @@ static void ath_rx_count_airtime(struct ath_softc *sc,
 				 struct ath_rx_status *rs,
 				 struct sk_buff *skb)
 {
-	struct ath_node *an;
-	struct ath_acq *acq;
-	struct ath_vif *avp;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_common *common = ath9k_hw_common(ah);
@@ -1019,7 +1016,7 @@ static void ath_rx_count_airtime(struct ath_softc *sc,
 	int phy;
 	u16 len = rs->rs_datalen;
 	u32 airtime = 0;
-	u8 tidno, acno;
+	u8 tidno;
 
 	if (!ieee80211_is_data(hdr->frame_control))
 		return;
@@ -1029,11 +1026,7 @@ static void ath_rx_count_airtime(struct ath_softc *sc,
 	sta = ieee80211_find_sta_by_ifaddr(sc->hw, hdr->addr2, NULL);
 	if (!sta)
 		goto exit;
-	an = (struct ath_node *) sta->drv_priv;
-	avp = (struct ath_vif *) an->vif->drv_priv;
 	tidno = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
-	acno = TID_TO_WME_AC(tidno);
-	acq = &avp->chanctx->acq[acno];
 
 	rxs = IEEE80211_SKB_RXCB(skb);
