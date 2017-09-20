From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Sep 2017 17:34:18 +0000
Subject: [PATCH] staging: rtl8723bs: avoid null pointer dereference on pmlmepriv
Message-Id: <20170920173418.17570-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a check to see if pmlmepriv is null before vfree'ing
pmlmepriv->free_bss_buf hence implying pmlmepriv could potenially be
null. However, a previous call to rtw_free_mlme_priv_ie_data
can also dereference pmlmepriv, so move this call so that it is only
called if pmlmepriv non-null.

Detected by CoverityScan, CID#1077739 ("Dereference before null check")

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 37b683d4d1fa..0d94ced985c0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -119,9 +119,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 
 void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
 	if (pmlmepriv) {
+		rtw_free_mlme_priv_ie_data(pmlmepriv);
 		if (pmlmepriv->free_bss_buf) {
 			vfree(pmlmepriv->free_bss_buf);
 		}
-- 
2.14.1

