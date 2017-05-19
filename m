From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 17:49:07 +0000
Subject: [PATCH 2/4] ueagle-atm: Improve a size determination in uea_bind()
Message-Id: <0cf69514-9270-2e34-a9f1-6af2644ac48e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
In-Reply-To: <d1c7c5d1-68b8-bbfc-8d0b-71a8e6cdd152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthieu Castet <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 May 2017 19:09:28 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 16fd87df69e1..9725e6f2f301 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2551,7 +2551,7 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 			return ret;
 	}
 
-	sc = kzalloc(sizeof(struct uea_softc), GFP_KERNEL);
+	sc = kzalloc(sizeof(*sc), GFP_KERNEL);
 	if (!sc)
 		return -ENOMEM;
 
-- 
2.13.0

