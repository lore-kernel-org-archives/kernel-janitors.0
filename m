From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 08 Oct 2018 14:16:59 +0000
Subject: [PATCH] rtl8xxxu: Remove set but not used variables 'usedesc40' and 'seq_number'
Message-Id: <1539008219-149058-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jes Sorensen <Jes.Sorensen@gmail.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c: In function 'rtl8xxxu_tx':
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:4925:7: warning:
 variable 'usedesc40' set but not used [-Wunused-but-set-variable]

drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:4921:6: warning:
 variable 'seq_number' set but not used [-Wunused-but-set-variable]

'usedesc40' and 'seq_number' are not used any more after
commit b59415c2dd08 ("rtl8xxxu: Split filling of TX descriptors into separate functions")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
index 73f6fc0..56040b1 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
@@ -4918,11 +4918,10 @@ static void rtl8xxxu_tx(struct ieee80211_hw *hw,
 	struct device *dev = &priv->udev->dev;
 	u32 queue, rts_rate;
 	u16 pktlen = skb->len;
-	u16 seq_number;
 	u16 rate_flag = tx_info->control.rates[0].flags;
 	int tx_desc_size = priv->fops->tx_desc_size;
 	int ret;
-	bool usedesc40, ampdu_enable, sgi = false, short_preamble = false;
+	bool ampdu_enable, sgi = false, short_preamble = false;
 
 	if (skb_headroom(skb) < tx_desc_size) {
 		dev_warn(dev,
@@ -4946,7 +4945,6 @@ static void rtl8xxxu_tx(struct ieee80211_hw *hw,
 	if (ieee80211_is_action(hdr->frame_control))
 		rtl8xxxu_dump_action(dev, hdr);
 
-	usedesc40 = (tx_desc_size = 40);
 	tx_info->rate_driver_data[0] = hw;
 
 	if (control && control->sta)
@@ -5013,7 +5011,6 @@ static void rtl8xxxu_tx(struct ieee80211_hw *hw,
 	else
 		rts_rate = 0;
 
-	seq_number = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
 	priv->fops->fill_txdesc(hw, hdr, tx_info, tx_desc, sgi, short_preamble,
 				ampdu_enable, rts_rate);
