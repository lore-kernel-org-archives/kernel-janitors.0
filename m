From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 06 Mar 2006 20:13:31 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/parport/
Message-Id: <1141676011.6349.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62461433133262534=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============62461433133262534==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts crypto/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/parport/parport_serial.c.orig	2006-03-05 16:08:07.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/parport/parport_serial.c	2006-03-05 16:08:17.000000000 +0100
@@ -368,10 +368,9 @@ static int __devinit parport_serial_pci_
 	struct parport_serial_private *priv;
 	int err;
 
-	priv = kmalloc (sizeof *priv, GFP_KERNEL);
+	priv = kzalloc (sizeof *priv, GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-	memset(priv, 0, sizeof(struct parport_serial_private));
 	pci_set_drvdata (dev, priv);
 
 	err = pci_enable_device (dev);
--- linux-2.6.16-rc5-mm1/drivers/parport/parport_cs.c.orig	2006-03-05 16:08:23.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/parport/parport_cs.c	2006-03-05 16:08:32.000000000 +0100
@@ -106,9 +106,8 @@ static int parport_probe(struct pcmcia_d
     DEBUG(0, "parport_attach()\n");
 
     /* Create new parport device */
-    info = kmalloc(sizeof(*info), GFP_KERNEL);
+    info = kzalloc(sizeof(*info), GFP_KERNEL);
     if (!info) return -ENOMEM;
-    memset(info, 0, sizeof(*info));
     link->priv = info;
     info->p_dev = link;
 



--===============62461433133262534==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62461433133262534==--
