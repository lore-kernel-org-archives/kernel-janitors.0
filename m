From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Aug 2018 12:50:30 +0000
Subject: [PATCH] ath9k: remove unused array firstep_table
Message-Id: <20180816125030.4416-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array firstep_table is being assigned but is never used
hence it is redundant and can be removed.

Cleans up clang warning:
warning: 'firstep_table' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ath/ath9k/ar5008_phy.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ar5008_phy.c b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
index ef2dd68d3f77..11d6f975c87d 100644
--- a/drivers/net/wireless/ath/ath9k/ar5008_phy.c
+++ b/drivers/net/wireless/ath/ath9k/ar5008_phy.c
@@ -37,10 +37,6 @@
 #define AR5008_11NG_HT_SS_SHIFT		12
 #define AR5008_11NG_HT_DS_SHIFT		20
 
-static const int firstep_table[] -/* level:  0   1   2   3   4   5   6   7   8  */
-	{ -4, -2,  0,  2,  4,  6,  8, 10, 12 }; /* lvl 0-8, default 2 */
-
 /*
  * register values to turn OFDM weak signal detection OFF
  */
-- 
2.17.1
