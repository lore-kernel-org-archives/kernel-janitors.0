From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 14 Aug 2005 13:28:22 +0000
Subject: [KJ] [PATCH] parport_serial: fmt warning fixes for 64-bit platforms
Message-Id: <20050814132822.GC15052@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022996502159762233=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============022996502159762233==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix

drivers/parport/parport_serial.c: In function `serial_register':
drivers/parport/parport_serial.c:327: warning: unsigned int format, different type arg (arg 3)
drivers/parport/parport_serial.c: In function `parport_register':
drivers/parport/parport_serial.c:374: warning: unsigned int format, different type arg (arg 3)

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/parport/parport_serial.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux-fmt.orig/drivers/parport/parport_serial.c
+++ linux-fmt/drivers/parport/parport_serial.c
@@ -322,7 +322,7 @@ static int __devinit serial_register (st
 
 		if (priv->num_ser == ARRAY_SIZE (priv->line)) {
 			printk (KERN_WARNING
-				"parport_serial: %s: only %u serial lines "
+				"parport_serial: %s: only %zu serial lines "
 				"supported (%d reported)\n", pci_name (dev),
 				ARRAY_SIZE (priv->line), board->num_ports);
 			break;
@@ -369,7 +369,7 @@ static int __devinit parport_register (s
 
 		if (priv->num_par == ARRAY_SIZE (priv->port)) {
 			printk (KERN_WARNING
-				"parport_serial: %s: only %u parallel ports "
+				"parport_serial: %s: only %zu parallel ports "
 				"supported (%d reported)\n", pci_name (dev),
 				ARRAY_SIZE (priv->port), card->numports);
 			break;


--===============022996502159762233==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022996502159762233==--
