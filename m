From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 15:00:22 +0000
Subject: [PATCH] rtlwifi: rtl8821ae: make array static const and remove redundant assignment
Message-Id: <20190905150022.3609-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array channel_all can be make static const rather than populating
it on the stack, this makes the code smaller.  Also, variable place
is being initialized with a value that is never read, so this assignment
is redundant and can be removed.

Before:
   text	   data	    bss	    dec	    hex	filename
 118537	   9591	      0	 128128	  1f480	realtek/rtlwifi/rtl8821ae/phy.o

After:
   text	   data	    bss	    dec	    hex	filename
 118331	   9687	      0	 128018	  1f412	realtek/rtlwifi/rtl8821ae/phy.o

Saves 110 bytes, (gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
index 408af144098e..979e434a4e73 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/phy.c
@@ -3613,14 +3613,14 @@ u8 rtl8821ae_phy_sw_chnl(struct ieee80211_hw *hw)
 
 u8 _rtl8812ae_get_right_chnl_place_for_iqk(u8 chnl)
 {
-	u8 channel_all[TARGET_CHNL_NUM_2G_5G_8812] = {
+	static const u8 channel_all[TARGET_CHNL_NUM_2G_5G_8812] = {
 		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
 		14, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54,
 		56, 58, 60, 62, 64, 100, 102, 104, 106, 108,
 		110, 112, 114, 116, 118, 120, 122, 124, 126,
 		128, 130, 132, 134, 136, 138, 140, 149, 151,
 		153, 155, 157, 159, 161, 163, 165};
-	u8 place = chnl;
+	u8 place;
 
 	if (chnl > 14) {
 		for (place = 14; place < sizeof(channel_all); place++)
-- 
2.20.1
