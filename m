From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 12:08:03 +0000
Subject: [PATCH] rtw88: fix spelling mistake: "unsupport" -> "unsupported"
Message-Id: <20200806120803.60113-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some spelling mistakes in rtw_info messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/rtw8822b.c | 4 ++--
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822b.c b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
index 351cd055a295..b7a98dbbb09c 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822b.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822b.c
@@ -1009,12 +1009,12 @@ static int rtw8822b_set_antenna(struct rtw_dev *rtwdev,
 		antenna_tx, antenna_rx);
 
 	if (!rtw8822b_check_rf_path(antenna_tx)) {
-		rtw_info(rtwdev, "unsupport tx path 0x%x\n", antenna_tx);
+		rtw_info(rtwdev, "unsupported tx path 0x%x\n", antenna_tx);
 		return -EINVAL;
 	}
 
 	if (!rtw8822b_check_rf_path(antenna_rx)) {
-		rtw_info(rtwdev, "unsupport rx path 0x%x\n", antenna_rx);
+		rtw_info(rtwdev, "unsupported rx path 0x%x\n", antenna_rx);
 		return -EINVAL;
 	}
 
diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 426808413baa..ed1c14af082b 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -2014,7 +2014,7 @@ static int rtw8822c_set_antenna(struct rtw_dev *rtwdev,
 	case BB_PATH_AB:
 		break;
 	default:
-		rtw_info(rtwdev, "unsupport tx path 0x%x\n", antenna_tx);
+		rtw_info(rtwdev, "unsupported tx path 0x%x\n", antenna_tx);
 		return -EINVAL;
 	}
 
@@ -2024,7 +2024,7 @@ static int rtw8822c_set_antenna(struct rtw_dev *rtwdev,
 	case BB_PATH_AB:
 		break;
 	default:
-		rtw_info(rtwdev, "unsupport rx path 0x%x\n", antenna_rx);
+		rtw_info(rtwdev, "unsupported rx path 0x%x\n", antenna_rx);
 		return -EINVAL;
 	}
 
-- 
2.27.0
