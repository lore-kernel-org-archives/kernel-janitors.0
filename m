From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Feb 2015 16:13:43 +0000
Subject: [PATCH] USB: whci-hcd: Delete an unnecessary check before the function call "usb_put_hcd"
Message-Id: <54D396B7.9060303@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Feb 2015 16:54:12 +0100

The usb_put_hcd() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/host/whci/hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/whci/hcd.c b/drivers/usb/host/whci/hcd.c
index d7b363a..43626c4 100644
--- a/drivers/usb/host/whci/hcd.c
+++ b/drivers/usb/host/whci/hcd.c
@@ -313,8 +313,7 @@ error_wusbhc_create:
 	uwb_rc_put(wusbhc->uwb_rc);
 error:
 	whc_clean_up(whc);
-	if (usb_hcd)
-		usb_put_hcd(usb_hcd);
+	usb_put_hcd(usb_hcd);
 	return ret;
 }
 
-- 
2.2.2

