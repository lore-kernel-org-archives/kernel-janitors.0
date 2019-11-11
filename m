From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 11 Nov 2019 03:34:27 +0000
Subject: [PATCH] rtw88: remove duplicated include from ps.c
Message-Id: <20191111033427.122443-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireless/realtek/rtw88/ps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index 820e0a3a141c..2226e3e7d7f8 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -9,7 +9,6 @@
 #include "mac.h"
 #include "coex.h"
 #include "debug.h"
-#include "reg.h"
 
 static int rtw_ips_pwr_up(struct rtw_dev *rtwdev)
 {
