From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Mar 2006 14:32:45 +0000
Subject: [KJ][Patch] check request_irq return value in ser_a2232.c
Message-Id: <1142087566.7820.25.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0086543775421588087=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0086543775421588087==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

ser_a2232.c was calling request_irq without checking its return value in
a2232board_init @ line 798.

The patch below just checks the return value, cleaning up and exiting on
failure.

Unfortunately this is m68k and pcc again (not i386), so it is not
compile tested.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

  --- linux-2.6.16-rc5/drivers/char/ser_a2232.c.orig	2006-03-12 00:55:19.000000000 +1100
+++ linux-2.6.16-rc5/drivers/char/ser_a2232.c	2006-03-12 01:12:28.000000000 +1100
@@ -795,7 +795,13 @@ static int __init a2232board_init(void)
 	*/
 	if (a2232_init_drivers()) return -ENODEV; // maybe we should use a different -Exxx?
 
-	request_irq(IRQ_AMIGA_VERTB, a2232_vbl_inter, 0, "A2232 serial VBL", a2232_driver_ID);
+	if (request_irq(IRQ_AMIGA_VERTB, a2232_vbl_inter, 0, "A2232 serial VBL", a2232_driver_ID) < 0)
+	{
+		printk(KERN_ERR "a2232board_init could not request_irq\n");
+		tty_unregister_driver(a2232_driver);
+		put_tty_driver(a2232_driver);
+		return -EBUSY;
+	}
 	return 0;
 }
 



--===============0086543775421588087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0086543775421588087==--
