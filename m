From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 03 Jan 2006 14:56:11 +0000
Subject: [KJ] [PATCH] drivers/i2c: Use ARRAY_SIZE macro
Message-Id: <20060103145611.GA1239@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94539076820544032=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94539076820544032==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]). Some trailing
whitespaces are also removed.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 i2c-parport-light.c |    9 +++------
 i2c-parport.c       |    7 ++-----
 i2c-pxa.c           |    2 +-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff -urpN -X dontdiff linux-2.6.15/drivers/i2c/busses/i2c-parport.c linux-2.6.15~array_size/drivers/i2c/busses/i2c-parport.c
--- linux-2.6.15/drivers/i2c/busses/i2c-parport.c	2006-01-03 14:41:55.000000000 +0100
+++ linux-2.6.15~array_size/drivers/i2c/busses/i2c-parport.c	2006-01-03 15:36:13.000000000 +0100
@@ -241,14 +241,11 @@ static struct parport_driver i2c_parport
 
 static int __init i2c_parport_init(void)
 {
-	int type_count;
-
-	type_count = sizeof(adapter_parm)/sizeof(struct adapter_parm);
-	if (type < 0 || type >= type_count) {
+	if (type < 0 || type >= ARRAY_SIZE(adapter_parm)) {
 		printk(KERN_WARNING "i2c-parport: invalid type (%d)\n", type);
 		type = 0;
 	}
-	
+
 	return parport_register_driver(&i2c_parport_driver);
 }
 
diff -urpN -X dontdiff linux-2.6.15/drivers/i2c/busses/i2c-parport-light.c linux-2.6.15~array_size/drivers/i2c/busses/i2c-parport-light.c
--- linux-2.6.15/drivers/i2c/busses/i2c-parport-light.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15~array_size/drivers/i2c/busses/i2c-parport-light.c	2006-01-03 15:35:14.000000000 +0100
@@ -121,14 +121,11 @@ static struct i2c_adapter parport_adapte
 
 static int __init i2c_parport_init(void)
 {
-	int type_count;
-
-	type_count = sizeof(adapter_parm)/sizeof(struct adapter_parm);
-	if (type < 0 || type >= type_count) {
+	if (type < 0 || type >= ARRAY_SIZE(adapter_parm)) {
 		printk(KERN_WARNING "i2c-parport: invalid type (%d)\n", type);
 		type = 0;
 	}
-	
+
 	if (base == 0) {
 		printk(KERN_INFO "i2c-parport: using default base 0x%x\n", DEFAULT_BASE);
 		base = DEFAULT_BASE;
@@ -152,7 +149,7 @@ static int __init i2c_parport_init(void)
 		release_region(base, 3);
 		return -ENODEV;
 	}
-	
+
 	return 0;
 }
 
diff -urpN -X dontdiff linux-2.6.15/drivers/i2c/busses/i2c-pxa.c linux-2.6.15~array_size/drivers/i2c/busses/i2c-pxa.c
--- linux-2.6.15/drivers/i2c/busses/i2c-pxa.c	2006-01-03 14:41:55.000000000 +0100
+++ linux-2.6.15~array_size/drivers/i2c/busses/i2c-pxa.c	2006-01-03 15:16:10.000000000 +0100
@@ -861,7 +861,7 @@ static irqreturn_t i2c_pxa_handler(int t
 		decode_ISR(isr);
 	}
 
-	if (i2c->irqlogidx < sizeof(i2c->isrlog)/sizeof(u32))
+	if (i2c->irqlogidx < ARRAY_SIZE(i2c->isrlog))
 		i2c->isrlog[i2c->irqlogidx++] = isr;
 
 	show_state(i2c);

--===============94539076820544032==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94539076820544032==--
