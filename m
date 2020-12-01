From: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
Date: Tue, 01 Dec 2020 21:49:15 +0000
Subject: [PATCH] Staging: rtl8723bs/core fix brace coding style issue in rtw_ioctl_set.c.
Message-Id: <20201201214915.GA397311@a>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix a brace warning found by the checkpatch.pl tool at line 178.

WARNING: braces {} are not necessary for any arm of this statement.

Signed-off-by: Brother Matthew De Angelis <matthew.v.deangelis@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 3adeca6f20ec..a7aa689ef4d4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -175,11 +175,10 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 
 
 	DBG_871X("Set BSSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) = true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) = true)
 		goto handle_tkip_countermeasure;
-	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) = true) {
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) = true)
 		goto release_mlme_lock;
-	}
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) = true) {
 		RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_info_, ("set_bssid: _FW_LINKED||WIFI_ADHOC_MASTER_STATE\n"));
-- 
2.25.1

My apologies, I meant to sent this. 
Would a patch like this be worth Greg's time?
