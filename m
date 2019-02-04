From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 18:24:29 +0000
Subject: [PATCH] Staging: rtl8723bs: remove some dead code
Message-Id: <20190204182343.GA8823@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"psecnetwork" is the address of &psecuritypriv->sec_bss.  Since
->sec_bss isn't the first member of the struct that means that
"psecnetwork" can't be NULL.

We can just remove this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ea2c187e56bd..91520ca3bbad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -835,14 +835,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	}
 
 	psecnetwork = (struct wlan_bssid_ex *)&psecuritypriv->sec_bss;
-	if (psecnetwork = NULL) {
-		kfree(pcmd);
-		res = _FAIL;
-
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_err_, ("rtw_joinbss_cmd :psecnetwork = NULL!!!\n"));
-
-		goto exit;
-	}
 
 	memset(psecnetwork, 0, t_len);
 
-- 
2.17.1
