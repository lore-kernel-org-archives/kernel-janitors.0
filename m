From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 15 Mar 2006 12:46:54 +0000
Subject: [KJ][Patch] check return value of request_region and request_irq
Message-Id: <1142426815.7781.47.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55814684229909828=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============55814684229909828==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

m32r_pcc.c calls request_irq without checking its return value @ line
346, and request_region without checking its return value @ line 333.

The patch below checks the two return values, and serialises the error
path of init_m32r_pcc().

Note this driver is for the m32r arch so this patch is not even compile
tested, it might not even come close to compiling(I would appreciate a
report either way). Also this may be a low level driver that will never
fail a request_region or request_irq, I don't know.
(I figured why the hell not send a patch?)

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>


--- linux-2.6.16-rc6/drivers/pcmcia/m32r_pcc.c.orig	2006-03-14 20:55:44.000000000 +1100
+++ linux-2.6.16-rc6/drivers/pcmcia/m32r_pcc.c	2006-03-15 23:32:00.000000000 +1100
@@ -312,7 +312,7 @@ static int __init is_alive(u_short sock)
 	return 0;
 }
 
-static void add_pcc_socket(ulong base, int irq, ulong mapaddr, kio_addr_t ioaddr)
+static int add_pcc_socket(ulong base, int irq, ulong mapaddr, kio_addr_t ioaddr)
 {
   	pcc_socket_t *t = &socket[pcc_sockets];
 
@@ -330,7 +330,8 @@ static void add_pcc_socket(ulong base, i
 
 	/* add pcc */
 	if (t->base > 0) {
-		request_region(t->base, 0x20, "m32r-pcc");
+		if ( request_region(t->base, 0x20, "m32r-pcc")== 0)
+			return -EBUSY;
 	}
 
 	printk(KERN_INFO "  %s ", pcc[pcc_sockets].name);
@@ -343,11 +344,13 @@ static void add_pcc_socket(ulong base, i
 	t->socket.irq_mask = 0;
 	t->socket.pci_irq = 2 + pcc_sockets; /* XXX */
 
-	request_irq(irq, pcc_interrupt, 0, "m32r-pcc", pcc_interrupt);
+	if (request_irq(irq, pcc_interrupt, 0, "m32r-pcc", pcc_interrupt) < 0) {
+		release_region(t->base, 0x20);
+		return -EBUSY;
 
 	pcc_sockets++;
 
-	return;
+	return 0;
 }
 
 
@@ -692,32 +695,38 @@ static struct platform_device pcc_device
 static int __init init_m32r_pcc(void)
 {
 	int i, ret;
+  	pcc_socket_t *t;
 
 	ret = driver_register(&pcc_driver);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = platform_device_register(&pcc_device);
-	if (ret){
-		driver_unregister(&pcc_driver);
-		return ret;
-	}
+	if (ret)
+		goto pdr_out;
+
 
 	printk(KERN_INFO "m32r PCC probe:\n");
 
 	pcc_sockets = 0;
 
-	add_pcc_socket(M32R_PCC0_BASE, PCC0_IRQ, M32R_PCC0_MAPBASE, 0x1000);
+	ret = add_pcc_socket(M32R_PCC0_BASE, PCC0_IRQ,
+						M32R_PCC0_MAPBASE, 0x1000);
+	if (ret)	
+		goto ap_out;
 
 #ifdef CONFIG_M32RPCC_SLOT2
-	add_pcc_socket(M32R_PCC1_BASE, PCC1_IRQ, M32R_PCC1_MAPBASE, 0x2000);
+	ret = add_pcc_socket(M32R_PCC1_BASE, PCC1_IRQ,
+						M32R_PCC1_MAPBASE, 0x2000);
+	if (ret) 
+		goto aps_out;
+
 #endif
 
 	if (pcc_sockets == 0) {
 		printk("socket is not found.\n");
-		platform_device_unregister(&pcc_device);
-		driver_unregister(&pcc_driver);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto ns_out;
 	}
 
 	/* Set up interrupt handler(s) */
@@ -750,6 +759,25 @@ static int __init init_m32r_pcc(void)
 	}
 
 	return 0;
+	
+	
+ns_out:
+#ifdef CONFIG_M32RPCC_SLOT2
+	free_irq(PCC1_IRQ, pcc_interrupt);
+	t = &socket[--pcc_sockets];
+	release_region(t->base, 0x20);
+#endif	
+aps_out:
+	free_irq(PCC0_IRQ, pcc_interrupt);
+	t = &socket[--pcc_sockets];
+	release_region(t->base, 0x20);
+ap_out:
+	platform_device_unregister(&pcc_device);
+pdr_out:
+	driver_unregister(&pcc_driver);
+out:
+	return ret;
+	
 } /* init_m32r_pcc */
 
 static void __exit exit_m32r_pcc(void)



--===============55814684229909828==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55814684229909828==--
