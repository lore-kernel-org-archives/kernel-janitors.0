From: Greg Aumann <Greg_Aumann@sil.org>
Date: Thu, 08 Apr 2004 13:30:06 +0000
Subject: [Kernel-janitors] (no subject)
Message-Id: <407553DE.1070907@sil.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010209020603060803030203"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
In-Reply-To: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010209020603060803030203
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
    this is my first attempt at a kernel patch. It's pretty trivial, but 
hey I have to start somewhere :-)! It updates one error message and one 
comment to reflect someone else's removal/replacement of check_region. 
It compiles ok but I don't have one of these devices so I can't do any 
other testing.

The patch is against 2.6.5.

Comments are welcome.

Greg

--------------010209020603060803030203
Content-Type: text/x-patch;
 name="comio90_check_region.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="comio90_check_region.patch"

diff -x tags -Naur linux-2.6.5/drivers/net/arcnet/com90io.c linux-2.6.5-kj/drivers/net/arcnet/com90io.c
--- linux-2.6.5/drivers/net/arcnet/com90io.c	2004-04-04 11:36:55.000000000 +0800
+++ linux-2.6.5-kj/drivers/net/arcnet/com90io.c	2004-04-08 20:22:43.000000000 +0800
@@ -160,7 +160,7 @@
 		return -ENODEV;
 	}
 	if (!request_region(ioaddr, ARCNET_TOTAL_SIZE, "com90io probe")) {
-		BUGMSG(D_INIT_REASONS, "IO check_region %x-%x failed.\n",
+		BUGMSG(D_INIT_REASONS, "IO request_region %x-%x failed.\n",
 		       ioaddr, ioaddr + ARCNET_TOTAL_SIZE - 1);
 		return -ENXIO;
 	}
@@ -242,7 +242,7 @@
 		BUGMSG(D_NORMAL, "Can't get IRQ %d!\n", dev->irq);
 		return -ENODEV;
 	}
-	/* Reserve the I/O region - guaranteed to work by check_region */
+	/* Reserve the I/O region */
 	if (!request_region(dev->base_addr, ARCNET_TOTAL_SIZE, "arcnet (COM90xx-IO)")) {
 		free_irq(dev->irq, dev);
 		return -EBUSY;

--------------010209020603060803030203
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010209020603060803030203--
