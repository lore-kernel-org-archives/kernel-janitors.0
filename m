From: Colin King <colin.king@canonical.com>
Date: Tue, 22 Jan 2019 14:15:54 +0000
Subject: [PATCH] staging: rtl8723bs: fix indentation issue with return statement
Message-Id: <20190122141554.24142-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statement is indented incorrectly, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 625e67f39889..094d61bcb469 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2389,7 +2389,7 @@ sint xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fr
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) = false) {
 		DBG_COUNTER(padapter->tx_logs.core_tx_ap_enqueue_warn_fwstate);
-	    return ret;
+		return ret;
 	}
 /*
 	if (pattrib->psta)
-- 
2.19.1
