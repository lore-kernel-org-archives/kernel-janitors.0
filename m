From: Victor Fusco <victor@cetuc.puc-rio.br>
Date: Mon, 27 Jun 2005 21:08:24 +0000
Subject: [KJ] [PATCH] drivers/net/8139cp.c: MODULE_PARM -> module_param
Message-Id: <200506272108.24896.victor@cetuc.puc-rio.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_IrGwCIzGmrNVih2"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_IrGwCIzGmrNVih2
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

description:
Use module_param() instead of the old MODULE_PARM()

Signed-off-by: Victor Fusco <victor@cetuc.puc-rio.br>

--Boundary-00=_IrGwCIzGmrNVih2
Content-Type: text/x-diff; charset="us-ascii"; name="8139cp_module_param.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="8139cp_module_param.patch"

diff -Nru linux-2.6.12/drivers/net/8139cp.c linux-2.6.12-devel/drivers/net/8139cp.c
--- linux-2.6.12/drivers/net/8139cp.c	2005-06-17 19:48:29.000000000 +0000
+++ linux-2.6.12-devel/drivers/net/8139cp.c	2005-06-27 16:17:47.000000000 +0000
@@ -94,13 +94,13 @@
 MODULE_LICENSE("GPL");
 
 static int debug = -1;
-MODULE_PARM (debug, "i");
+module_param(debug, int, 0);
 MODULE_PARM_DESC (debug, "8139cp: bitmapped message enable number");
 
 /* Maximum number of multicast addresses to filter (vs. Rx-all-multicast).
    The RTL chips use a 64 element hash table based on the Ethernet CRC.  */
 static int multicast_filter_limit = 32;
-MODULE_PARM (multicast_filter_limit, "i");
+module_param(multicast_filter_limit, int, 0);
 MODULE_PARM_DESC (multicast_filter_limit, "8139cp: maximum number of filtered multicast addresses");
 
 #define PFX			DRV_NAME ": "

--Boundary-00=_IrGwCIzGmrNVih2
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_IrGwCIzGmrNVih2--
