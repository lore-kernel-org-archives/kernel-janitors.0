From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Thu, 26 Feb 2004 20:01:49 +0000
Subject: [Kernel-janitors] [PATCH] - drivers/serial/8250_pnp.c init section
Message-Id: <1077825653.31019.35.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all,

Other trivial patch.

diff -pNru linux-2.6.3-bk8/drivers/serial/8250_pnp.c linux-2.6.3-bk8~/drivers/serial/8250_pnp.c
--- linux-2.6.3-bk8/drivers/serial/8250_pnp.c	2004-02-26 14:55:36.000000000 -0300
+++ linux-2.6.3-bk8~/drivers/serial/8250_pnp.c	2004-02-26 14:36:31.000000000 -0300
@@ -390,7 +390,7 @@ static int __devinit serial_pnp_guess_bo
 	return -ENODEV;
 }
 
-static int
+static int __devinit
 serial_pnp_probe(struct pnp_dev * dev, const struct pnp_device_id *dev_id)
 {
 	struct serial_struct serial_req;
@@ -420,7 +420,7 @@ serial_pnp_probe(struct pnp_dev * dev, c
 
 }
 
-static void serial_pnp_remove(struct pnp_dev * dev)
+static void __devexit serial_pnp_remove(struct pnp_dev * dev)
 {
 	int line = (int)pnp_get_drvdata(dev);
 	if (line)

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
