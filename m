From: Thomas Avery <tavery321@gmail.com>
Date: Tue, 20 Mar 2018 21:45:41 +0000
Subject: [PATCH] staging: rtl8723bs/core/rtw_mlme_ext.c: Replace yield() call with cond_resched
Message-Id: <20180320214541.cknrcuercnhfrx2a@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove yield() call, yield() does not guarantee progress, and should not
be used. Cond_resched() is a safer alternative

Signed-off-by: Thomas Avery <tavery321@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 7d7756e40bcb..fdcc5b28af22 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4263,7 +4263,7 @@ unsigned int send_beacon(struct adapter *padapter)
 		issue_beacon(padapter, 100);
 		issue++;
 		do {
-			yield();
+			cond_resched();
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
 			poll++;
 		} while ((poll%10) != 0 && false = bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-- 
2.11.0

