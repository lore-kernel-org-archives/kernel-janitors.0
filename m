From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 13:09:00 +0000
Subject: [PATCH] USB-mxuport: Delete an unnecessary check before the function call "release_firmware"
Message-Id: <558FF1EC.2060605@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 14:59:04 +0200

The release_firmware() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/serial/mxuport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
index 460a406..92f7aee 100644
--- a/drivers/usb/serial/mxuport.c
+++ b/drivers/usb/serial/mxuport.c
@@ -1101,8 +1101,7 @@ static int mxuport_probe(struct usb_serial *serial,
 	 */
 	usb_set_serial_data(serial, (void *)id->driver_info);
 out:
-	if (fw_p)
-		release_firmware(fw_p);
+	release_firmware(fw_p);
 	return err;
 }
 
-- 
2.4.4

