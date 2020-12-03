From: Colin King <colin.king@canonical.com>
Date: Thu, 03 Dec 2020 17:51:42 +0000
Subject: [PATCH][next] rtw88: coex: fix missing unitialization of variable 'interval'
Message-Id: <20201203175142.1071738-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <tony0620emma@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, Ching-Te Ku <ku920601@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the variable 'interval' is not initialized and is only set
to 1 when oex_stat->bt_418_hid_existi is true.  Fix this by inintializing
variable interval to 0 (which I'm assuming is the intended default).

Addresses-Coverity: ("Uninitalized scalar variable")
Fixes: 5b2e9a35e456 ("rtw88: coex: add feature to enhance HID coexistence performance")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/coex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/coex.c b/drivers/net/wireless/realtek/rtw88/coex.c
index c704c6885a18..24530cafcba7 100644
--- a/drivers/net/wireless/realtek/rtw88/coex.c
+++ b/drivers/net/wireless/realtek/rtw88/coex.c
@@ -2051,7 +2051,7 @@ static void rtw_coex_action_bt_a2dp_hid(struct rtw_dev *rtwdev)
 	struct rtw_coex_dm *coex_dm = &coex->dm;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	struct rtw_chip_info *chip = rtwdev->chip;
-	u8 table_case, tdma_case, interval;
+	u8 table_case, tdma_case, interval = 0;
 	u32 slot_type = 0;
 	bool is_toggle_table = false;
 
-- 
2.29.2
