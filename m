From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 06 Dec 2018 11:58:16 +0000
Subject: [PATCH] rtlwifi: rtl8821ae: remove set but not used variable 'type' in translate_rx_signal_stuff
Message-Id: <1544097968-68563-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Tzu-En Huang <tehuang@realtek.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c: In function 'translate_rx_signal_stuff':
drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c:309:6: warning:
 variable 'type' set but not used [-Wunused-but-set-variable]

It never used since commit 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from
staging to regular tree")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c
index b01c3c5..0f2b7c6 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/trx.c
@@ -306,14 +306,12 @@ static void translate_rx_signal_stuff(struct ieee80211_hw *hw,
 	u8 *praddr;
 	u8 *psaddr;
 	__le16 fc;
-	u16 type;
 	bool packet_matchbssid, packet_toself, packet_beacon;
 
 	tmp_buf = skb->data + pstatus->rx_drvinfo_size + pstatus->rx_bufshift;
 
 	hdr = (struct ieee80211_hdr *)tmp_buf;
 	fc = hdr->frame_control;
-	type = WLAN_FC_GET_TYPE(hdr->frame_control);
 	praddr = hdr->addr1;
 	psaddr = ieee80211_get_SA(hdr);
 	ether_addr_copy(pstatus->psaddr, psaddr);
