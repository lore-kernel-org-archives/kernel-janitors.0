From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 12:50:57 +0000
Subject: [PATCH] staging: rtl8192e: clean up indentation issue
Message-Id: <20190926125057.16158-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.king@canonical.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The RT_TRACE is indented incorrectly, add in the missing tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index f932cb15e4e5..b08712a9c029 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -715,8 +715,8 @@ void rtl92e_set_wireless_mode(struct net_device *dev, u8 wireless_mode)
 	if ((wireless_mode = WIRELESS_MODE_N_24G) ||
 	    (wireless_mode = WIRELESS_MODE_N_5G)) {
 		priv->rtllib->pHTInfo->bEnableHT = 1;
-	RT_TRACE(COMP_DBG, "%s(), wireless_mode:%x, bEnableHT = 1\n",
-		 __func__, wireless_mode);
+		RT_TRACE(COMP_DBG, "%s(), wireless_mode:%x, bEnableHT = 1\n",
+			 __func__, wireless_mode);
 	} else {
 		priv->rtllib->pHTInfo->bEnableHT = 0;
 		RT_TRACE(COMP_DBG, "%s(), wireless_mode:%x, bEnableHT = 0\n",
-- 
2.20.1
