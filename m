From: Chuck Short <zul@gentoo.org>
Date: Tue, 16 Mar 2004 20:33:49 +0000
Subject: [Kernel-janitors] tcic kj audit
Message-Id: <405764AD.6070905@gentoo.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020307000003060500050807"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020307000003060500050807
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch changes char* into char[] and add's KERN_* to some printks to 
tcic.

chuck

--------------020307000003060500050807
Content-Type: text/plain;
 name="tcic-kj-audit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tcic-kj-audit.patch"

--- linux-2.6.4.orig/drivers/pcmcia/tcic.c	2004-03-11 02:55:28.000000000 +0000
+++ linux-2.6.4/drivers/pcmcia/tcic.c	2004-03-16 16:24:56.000000000 +0000
@@ -58,7 +58,7 @@
 #ifdef PCMCIA_DEBUG
 static int pc_debug = PCMCIA_DEBUG;
 MODULE_PARM(pc_debug, "i");
-static const char *version =
+static const char version[] =
 "tcic.c 1.111 2000/02/15 04:13:12 (David Hinds)";
 #define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
 #else
@@ -337,7 +337,7 @@ static int __init is_active(int s)
 
     if ((sstat & TCIC_SSTAT_CD) && (pwr & TCIC_PWR_VCC(s)) &&
 	(scf1 & TCIC_SCF1_IOSTS) && (ioctl & TCIC_ICTL_ENA) &&
-	(check_region(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
+	(region_request(base, num) != 0) && ((base & 0xfeef) != 0x02e8))
 	return 1;
     else
 	return 0;
@@ -403,7 +403,7 @@ static int __init init_tcic(void)
     sock = 0;
 
     if (!request_region(tcic_base, 16, "tcic-2")) {
-	printk("could not allocate ports,\n ");
+	printk(KERN_INFO "could not allocate ports,\n ");
 	driver_unregister(&tcic_driver);
 	return -ENODEV;
     }
@@ -505,11 +505,11 @@ static int __init init_tcic(void)
     }
     
     if (socket_table[0].socket.irq_mask & (1 << 11))
-	printk("sktirq is irq 11, ");
+	printk(KERN_INFO "sktirq is irq 11, ");
     if (cs_irq != 0)
-	printk("status change on irq %d\n", cs_irq);
+	printk(KERN_NOTICE "status change on irq %d\n", cs_irq);
     else
-	printk("polled status, interval = %d ms\n",
+	printk(KERN_INFO "polled status, interval = %d ms\n",
 	       poll_interval * 1000 / HZ);
     
     for (i = 0; i < sockets; i++) {

--------------020307000003060500050807
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020307000003060500050807--
