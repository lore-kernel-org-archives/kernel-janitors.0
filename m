From: Colin King <colin.king@canonical.com>
Date: Fri, 20 Oct 2017 18:40:24 +0000
Subject: [PATCH] staging: rtl8188eu: avoid a null dereference on pmlmepriv
Message-Id: <20171020184024.8035-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gargi Sharma <gs051095@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a check on pmlmepriv before dereferencing it when
vfree'ing pmlmepriv->free_bss_buf however the previous call
to rtw_free_mlme_priv_ie_data deferences pmlmepriv causing
a null pointer deference if it is null.  Avoid this by also
calling rtw_free_mlme_priv_ie_data if the pointer is non-null.

Detected by CoverityScan, CID#1230262 ("Dereference before null check")
Fixes: 7b464c9fa5cc ("staging: r8188eu: Add files for new driver - part 4")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index b15cf17f77c5..74cf99e1b732 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -106,10 +106,10 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 
 void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 {
-	rtw_free_mlme_priv_ie_data(pmlmepriv);
-
-	if (pmlmepriv)
+	if (pmlmepriv) {
+		rtw_free_mlme_priv_ie_data(pmlmepriv);
 		vfree(pmlmepriv->free_bss_buf);
+	}
 }
 
 struct wlan_network *_rtw_alloc_network(struct mlme_priv *pmlmepriv)
-- 
2.14.1

