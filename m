From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 08:46:11 +0000
Subject: [patch] USB: HWA: fix a warning message
Message-Id: <20141029084611.GE8939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We wanted to print the version as (major).(minor) but because the shift
operation is higher precedence than the mask then we print
(minor).(minor).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/host/hwa-hc.c b/drivers/usb/host/hwa-hc.c
index d0d8fad..1db0626 100644
--- a/drivers/usb/host/hwa-hc.c
+++ b/drivers/usb/host/hwa-hc.c
@@ -607,7 +607,7 @@ found:
 	wa->wa_descr = wa_descr = (struct usb_wa_descriptor *) hdr;
 	if (le16_to_cpu(wa_descr->bcdWAVersion) > 0x0100)
 		dev_warn(dev, "Wire Adapter v%d.%d newer than groked v1.0\n",
-			 le16_to_cpu(wa_descr->bcdWAVersion) & 0xff00 >> 8,
+			 (le16_to_cpu(wa_descr->bcdWAVersion) & 0xff00) >> 8,
 			 le16_to_cpu(wa_descr->bcdWAVersion) & 0x00ff);
 	result = 0;
 error:
