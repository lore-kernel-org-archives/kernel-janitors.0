From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Jul 2016 20:54:22 +0000
Subject: [PATCH] staging: rtl8188eu: Delete an unnecessary check before the function call "vfree"
Message-Id: <877f6c91-dc6c-1332-e9c2-3be89f61499d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <544954FD.8040607@users.sourceforge.net>
In-Reply-To: <544954FD.8040607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Bhumika Goyal <bhumirks@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 25 Jul 2016 22:20:24 +0200

The vfree() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index e0a5567..39ffb46 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -252,10 +252,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 		pxmitbuf++;
 	}
 
-	if (pxmitpriv->pallocated_xmit_extbuf) {
-		vfree(pxmitpriv->pallocated_xmit_extbuf);
-	}
-
+	vfree(pxmitpriv->pallocated_xmit_extbuf);
 	rtw_free_hwxmits(padapter);
 
 	mutex_destroy(&pxmitpriv->ack_tx_mutex);
-- 
2.9.2

