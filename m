From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:35:24 +0000
Subject: [KJ] [PATCH] convert orinoco_cs wireless driver to module_param
Message-Id: <20041109213524.GG9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50182161660871438=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50182161660871438==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in orinoco_cs wireless driver.

--- drivers/net/wireless/orinoco_cs.c.orig	2004-11-09 20:40:22.020919624 +0100
+++ drivers/net/wireless/orinoco_cs.c	2004-11-08 23:10:34.000000000 +0100
@@ -64,9 +64,9 @@ static int irq_list[4] = { -1 };
  * don't have any CIS entry for it. This workaround it... */
 static int ignore_cis_vcc; /* = 0 */
 
-MODULE_PARM(irq_mask, "i");
-MODULE_PARM(irq_list, "1-4i");
-MODULE_PARM(ignore_cis_vcc, "i");
+module_param(irq_mask, uint, 0444);
+module_param_array(irq_list, int, NULL, 0444);
+module_param(ignore_cis_vcc, bool, 0644);
 
 /********************************************************************/
 /* Magic constants						    */

--===============50182161660871438==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50182161660871438==--
