From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Feb 2019 02:23:47 +0000
Subject: [PATCH] rtlwifi: rtl8192se: Remove set but not used variable 'seg_ptr'
Message-Id: <20190227022347.7927-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c: In function '_rtl92s_firmware_downloadcode':
drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c:139:17: warning:
 variable 'seg_ptr' set but not used [-Wunused-but-set-variable]

It's not used after commit 59ae1d127ac0 ("networking: introduce and use
skb_put_data()")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
index faa307a0b148..541b7881735e 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/fw.c
@@ -136,7 +136,6 @@ static bool _rtl92s_firmware_downloadcode(struct ieee80211_hw *hw,
 	struct rtl_priv *rtlpriv = rtl_priv(hw);
 	struct sk_buff *skb;
 	struct rtl_tcb_desc *tcb_desc;
-	unsigned char *seg_ptr;
 	u16 frag_threshold = MAX_FIRMWARE_CODE_SIZE;
 	u16 frag_length, frag_offset = 0;
 	u16 extra_descoffset = 0;
@@ -166,9 +165,8 @@ static bool _rtl92s_firmware_downloadcode(struct ieee80211_hw *hw,
 		if (!skb)
 			return false;
 		skb_reserve(skb, extra_descoffset);
-		seg_ptr = skb_put_data(skb,
-				       code_virtual_address + frag_offset,
-				       (u32)(frag_length - extra_descoffset));
+		skb_put_data(skb, code_virtual_address + frag_offset,
+			     (u32)(frag_length - extra_descoffset));
 
 		tcb_desc = (struct rtl_tcb_desc *)(skb->cb);
 		tcb_desc->queue_index = TXCMD_QUEUE;
