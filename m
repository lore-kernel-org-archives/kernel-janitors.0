From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 17:47:27 +0000
Subject: [PATCH 1/4] ueagle-atm: Delete error messages for failed memory allocations in two functions
Message-Id: <e465c4ba-fe61-24c0-6e5b-b37abcf87d2c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
In-Reply-To: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 19:02:01 +0200

Omit two extra messages for memory allocation failures in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/atm/ueagle-atm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index df67815f74e6..16fd87df69e1 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -868,10 +868,8 @@ static int uea_idma_write(struct uea_softc *sc, const void *data, u32 size)
 	int bytes_read;
 
 	xfer_buff = kmemdup(data, size, GFP_KERNEL);
-	if (!xfer_buff) {
-		uea_err(INS_TO_USBDEV(sc), "can't allocate xfer_buff\n");
+	if (!xfer_buff)
 		return ret;
-	}
 
 	ret = usb_bulk_msg(sc->usb_dev,
 			 usb_sndbulkpipe(sc->usb_dev, UEA_IDMA_PIPE),
@@ -1147,10 +1145,8 @@ static int uea_request(struct uea_softc *sc,
 	int ret = -ENOMEM;
 
 	xfer_buff = kmemdup(data, size, GFP_KERNEL);
-	if (!xfer_buff) {
-		uea_err(INS_TO_USBDEV(sc), "can't allocate xfer_buff\n");
+	if (!xfer_buff)
 		return ret;
-	}
 
 	ret = usb_control_msg(sc->usb_dev, usb_sndctrlpipe(sc->usb_dev, 0),
 			      UCDC_SEND_ENCAPSULATED_COMMAND,
-- 
2.13.0

