From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Feb 2015 15:40:36 +0000
Subject: [PATCH] ueagle-atm: Delete unnecessary checks before the function call "release_firmware"
Message-Id: <54D38EF4.2010600@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>, linux-usb@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Feb 2015 16:33:09 +0100

The release_firmware() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/atm/ueagle-atm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 5a45937..888998a 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -952,7 +952,7 @@ static void uea_load_page_e1(struct work_struct *work)
 	int i;
 
 	/* reload firmware when reboot start and it's loaded already */
-	if (ovl = 0 && pageno = 0 && sc->dsp_firm) {
+	if (ovl = 0 && pageno = 0) {
 		release_firmware(sc->dsp_firm);
 		sc->dsp_firm = NULL;
 	}
@@ -1074,7 +1074,7 @@ static void uea_load_page_e4(struct work_struct *work)
 	uea_dbg(INS_TO_USBDEV(sc), "sending DSP page %u\n", pageno);
 
 	/* reload firmware when reboot start and it's loaded already */
-	if (pageno = 0 && sc->dsp_firm) {
+	if (pageno = 0) {
 		release_firmware(sc->dsp_firm);
 		sc->dsp_firm = NULL;
 	}
-- 
2.2.2

