From: Peter McCurdy <pmccurdy@nit.ca>
Date: Fri, 12 Mar 2004 16:44:54 +0000
Subject: [Kernel-janitors] Patch to change char * into char[]
Message-Id: <1079109894.756.34.camel@chopin.internal.nit.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-X7DbOv9JmdRKWsxJz7+F"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--=-X7DbOv9JmdRKWsxJz7+F
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

Attached is a patch to convert a few instances of 'char *foo = "bar";'
into 'char foo[] = "bar";'.  I started off with drivers/net/irda, I'll
do some more if everything is OK with this one.

Peter.



--=-X7DbOv9JmdRKWsxJz7+F
Content-Disposition: attachment; filename=char-array-irda.patch
Content-Type: text/plain; name=char-array-irda.patch; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

Binary files linux-2.6.4-kj-orig/drivers/net/irda/.irport.c.swp and linux-2.6.4/drivers/net/irda/.irport.c.swp differ
diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c linux-2.6.4/drivers/net/irda/ali-ircc.c
--- linux-2.6.4-kj-orig/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:15:01 2004
+++ linux-2.6.4/drivers/net/irda/ali-ircc.c	Fri Mar 12 10:47:24 2004
@@ -49,7 +49,7 @@
 #define CHIP_IO_EXTENT 8
 #define BROKEN_DONGLE_ID
 
-static char *driver_name = "ali-ircc";
+static char driver_name[] = "ali-ircc";
 
 /* Module parameters */
 static int qos_mtt_bits = 0x07;  /* 1 ms or more */
diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/irport.c linux-2.6.4/drivers/net/irda/irport.c
--- linux-2.6.4-kj-orig/drivers/net/irda/irport.c	Fri Mar 12 10:15:01 2004
+++ linux-2.6.4/drivers/net/irda/irport.c	Fri Mar 12 10:47:32 2004
@@ -72,7 +72,7 @@
 static unsigned int qos_mtt_bits = 0x03;
 
 static struct irport_cb *dev_self[] = { NULL, NULL, NULL, NULL};
-static char *driver_name = "irport";
+static char driver_name[] = "irport";
 
 static inline void irport_write_wakeup(struct irport_cb *self);
 static inline int  irport_write(int iobase, int fifo_size, __u8 *buf, int len);
diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/nsc-ircc.c linux-2.6.4/drivers/net/irda/nsc-ircc.c
--- linux-2.6.4-kj-orig/drivers/net/irda/nsc-ircc.c	Fri Mar 12 10:15:01 2004
+++ linux-2.6.4/drivers/net/irda/nsc-ircc.c	Fri Mar 12 10:46:51 2004
@@ -68,7 +68,7 @@
 #define CHIP_IO_EXTENT 8
 #define BROKEN_DONGLE_ID
 
-static char *driver_name = "nsc-ircc";
+static char driver_name[] = "nsc-ircc";
 
 /* Module parameters */
 static int qos_mtt_bits = 0x07;  /* 1 ms or more */
diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/via-ircc.c linux-2.6.4/drivers/net/irda/via-ircc.c
--- linux-2.6.4-kj-orig/drivers/net/irda/via-ircc.c	Fri Mar 12 10:15:01 2004
+++ linux-2.6.4/drivers/net/irda/via-ircc.c	Fri Mar 12 10:46:40 2004
@@ -65,7 +65,7 @@
 #define CHIP_IO_EXTENT 8
 #define BROKEN_DONGLE_ID
 
-static char *driver_name = "via-ircc";
+static char driver_name[] = "via-ircc";
 
 /* Module parameters */
 static int qos_mtt_bits = 0x07;	/* 1 ms or more */
diff -ruN linux-2.6.4-kj-orig/drivers/net/irda/w83977af_ir.c linux-2.6.4/drivers/net/irda/w83977af_ir.c
--- linux-2.6.4-kj-orig/drivers/net/irda/w83977af_ir.c	Fri Mar 12 10:15:01 2004
+++ linux-2.6.4/drivers/net/irda/w83977af_ir.c	Fri Mar 12 10:47:02 2004
@@ -69,7 +69,7 @@
 #define CONFIG_USE_W977_PNP        /* Currently needed */
 #define PIO_MAX_SPEED       115200 
 
-static char *driver_name = "w83977af_ir";
+static char driver_name[] = "w83977af_ir";
 static int  qos_mtt_bits = 0x07;   /* 1 ms or more */
 
 #define CHIP_IO_EXTENT 8

--=-X7DbOv9JmdRKWsxJz7+F
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--=-X7DbOv9JmdRKWsxJz7+F--
