From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 11:30:56 +0000
Subject: [PATCH][next] rtw88: remove redundant null pointer check on arrays
Message-Id: <20191025113056.19167-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Chris Chiu <chiu@endlessm.com>, Tzu-En Huang <tehuang@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The checks to see if swing_table->n or swing_table->p are null are
redundant since n and p are arrays and can never be null if
swing_table is non-null.  I believe these are redundant checks
and can be safely removed, especially the checks implies that these
are not arrays which can lead to confusion.

Addresses-Coverity: ("Array compared against 0")
Fixes: c97ee3e0bea2 ("rtw88: add power tracking support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/phy.c b/drivers/net/wireless/realtek/rtw88/phy.c
index 69e7edb629f4..11893ec73376 100644
--- a/drivers/net/wireless/realtek/rtw88/phy.c
+++ b/drivers/net/wireless/realtek/rtw88/phy.c
@@ -2071,7 +2071,7 @@ s8 rtw_phy_pwrtrack_get_pwridx(struct rtw_dev *rtwdev,
 		return 0;
 	}
 
-	if (!swing_table || !swing_table->n || !swing_table->p) {
+	if (!swing_table) {
 		rtw_warn(rtwdev, "swing table not configured\n");
 		return 0;
 	}
-- 
2.20.1
