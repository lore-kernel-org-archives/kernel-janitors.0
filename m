From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 08:47:33 +0000
Subject: [PATCH][next] rtw88: fix spelling mistake "fimrware" -> "firmware"
Message-Id: <20200424084733.7716-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in two rtw_err error messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/realtek/rtw88/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/mac.c b/drivers/net/wireless/realtek/rtw88/mac.c
index 645207a01525..056b08b9f06c 100644
--- a/drivers/net/wireless/realtek/rtw88/mac.c
+++ b/drivers/net/wireless/realtek/rtw88/mac.c
@@ -829,7 +829,7 @@ download_firmware_legacy(struct rtw_dev *rtwdev, const u8 *data, u32 size)
 		write_firmware_page(rtwdev, page, data, last_page_size);
 
 	if (!check_hw_ready(rtwdev, REG_MCUFW_CTRL, BIT_FWDL_CHK_RPT, 1)) {
-		rtw_err(rtwdev, "failed to check download fimrware report\n");
+		rtw_err(rtwdev, "failed to check download firmware report\n");
 		return -EINVAL;
 	}
 
@@ -856,7 +856,7 @@ static int download_firmware_validate_legacy(struct rtw_dev *rtwdev)
 		msleep(20);
 	}
 
-	rtw_err(rtwdev, "failed to validate fimrware\n");
+	rtw_err(rtwdev, "failed to validate firmware\n");
 	return -EINVAL;
 }
 
-- 
2.25.1
