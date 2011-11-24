From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 07:22:48 +0000
Subject: [patch] orinoco: remove an unused variable
Message-Id: <20111124072247.GE14122@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Jiri Pirko <jpirko@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Pavel Roskin <proski@gnu.org>, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, orinoco-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

The "version" isn't used anymore now that this is a module_usb_driver().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I wrote this patch against linux-next.

This is a fallout from d632eb1bf22 "USB: convert drivers/net/* to use
module_usb_driver()" so I'm not sure if this patch should go through
the USB tree or the wireless tree.

diff --git a/drivers/net/wireless/orinoco/orinoco_usb.c b/drivers/net/wireless/orinoco/orinoco_usb.c
index ae8ce56..f634d45 100644
--- a/drivers/net/wireless/orinoco/orinoco_usb.c
+++ b/drivers/net/wireless/orinoco/orinoco_usb.c
@@ -1754,11 +1754,6 @@ static struct usb_driver orinoco_driver = {
 	.id_table = ezusb_table,
 };
 
-/* Can't be declared "const" or the whole __initdata section will
- * become const */
-static char version[] __initdata = DRIVER_NAME " " DRIVER_VERSION
-	" (Manuel Estrada Sainz)";
-
 module_usb_driver(orinoco_driver);
 
 MODULE_AUTHOR("Manuel Estrada Sainz");
