From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Mar 2006 13:48:51 +0000
Subject: [KJ][Patch] check return value of request_irq in amiserial.c
Message-Id: <1142084932.7820.15.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34624555782490907=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============34624555782490907==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

amiserial.c does not check the return value of request_irq @ lines 2060
and 2061 in function rs_init();

The patch below checks the return value of the two calls and cleans up
before exiting on failure.

When trying to compile this file I found that this is some built-in
amiga serial driver and isn't used on i386 (only m68k and ppc), so 1,
this isn't even compile tested and 2 the patch might not be required as
the driver init might only be used in early boot code, I don't know.
(I thought I was safe from that problem as it was in drivers/) 

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/char/amiserial.c.orig	2006-02-28 18:55:06.000000000 +1100
+++ linux-2.6.16-rc5/drivers/char/amiserial.c	2006-03-12 00:44:55.000000000 +1100
@@ -2057,8 +2057,14 @@ static int __init rs_init(void)
 	local_irq_save(flags);
 
 	/* set ISRs, and then disable the rx interrupts */
-	request_irq(IRQ_AMIGA_TBE, ser_tx_int, 0, "serial TX", state);
-	request_irq(IRQ_AMIGA_RBF, ser_rx_int, SA_INTERRUPT, "serial RX", state);
+	if (request_irq(IRQ_AMIGA_TBE, ser_tx_int, 0, "serial TX", state) < 0)
+	{
+		goto err_irq;
+	}
+	if (request_irq(IRQ_AMIGA_RBF, ser_rx_int, SA_INTERRUPT, "serial RX", state) < 0)
+	{
+		goto err_irq_2;
+	}
 
 	/* turn off Rx and Tx interrupts */
 	custom.intena = IF_RBF | IF_TBE;
@@ -2078,6 +2084,14 @@ static int __init rs_init(void)
 	ciab.ddra &= ~(SER_DCD | SER_CTS | SER_DSR);  /* inputs */
 
 	return 0;
+
+err_irq_2:
+	free_irq(IRQ_AMIGA_TBE, state);
+err_irq:
+	local_irq_restore(flags);
+	release_mem_region(CUSTOM_PHYSADDR+0x30, 4);
+	printk(KERN_WARN "rs_init could not request_irq\n");
+	return -EBUSY;
 }
 
 static __exit void rs_exit(void) 



--===============34624555782490907==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34624555782490907==--
