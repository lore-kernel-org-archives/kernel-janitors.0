From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 21:02:37 +0000
Subject: [KJ] [Patch] kzalloc() conversion in drivers/sh
Message-Id: <1141592557.17717.14.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66558150998730126=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140815848.26064.4.camel@alice>
In-Reply-To: <1140815848.26064.4.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============66558150998730126==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts drivers/sh/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/drivers/sh/superhyway/superhyway.c.orig	2006-03-05 16:05:44.000000000 +0100
+++ linux-2.6.16-rc5-mm1/drivers/sh/superhyway/superhyway.c	2006-03-05 16:05:54.000000000 +0100
@@ -56,11 +56,9 @@ int superhyway_add_device(unsigned long 
 	struct superhyway_device *dev = sdev;
 
 	if (!dev) {
-		dev = kmalloc(sizeof(struct superhyway_device), GFP_KERNEL);
+		dev = kzalloc(sizeof(struct superhyway_device), GFP_KERNEL);
 		if (!dev)
 			return -ENOMEM;
-
-		memset(dev, 0, sizeof(struct superhyway_device));
 	}
 
 	dev->bus = bus;



--===============66558150998730126==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66558150998730126==--
