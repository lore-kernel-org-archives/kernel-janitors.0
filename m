From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:42:39 +0000
Subject: [Kernel-janitors] [PATCH] eicon/os_bri: replace schedule_timeout()
Message-Id: <20040723174239.GI1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24770439956871981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723174006.GE1911@us.ibm.com>
In-Reply-To: <20040723174006.GE1911@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============24770439956871981==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() and diva_os_wait()
with mdelay() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/os_bri.c	2004-06-16 05:18:57.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/os_bri.c	2004-07-02 18:07:28.000000000 +0000
@@ -525,7 +525,7 @@ static int diva_bri_reset_adapter(PISDN_
 			 IoAdapter->ANum)) return (-1);
 	}
 	(*(IoAdapter->rstFnc)) (IoAdapter);
-	diva_os_wait(100);
+	mdelay(100);
 	Port = DIVA_OS_MEM_ATTACH_PORT(IoAdapter);
 	addrHi = Port +
 	    ((IoAdapter->Properties.Bus == BUS_PCI) ? M_PCI_ADDRH : ADDRH);
@@ -546,7 +546,7 @@ static int diva_bri_reset_adapter(PISDN_
 		       BRI_SHARED_RAM_SIZE) >> 16));
 	outppw(addrLo, 0);
 	for (i = 0; i < 0x8000; outppw(ioaddr, 0), ++i);
-	diva_os_wait(100);
+	mdelay(100);
 
 	/*
 	   clear signature
@@ -679,7 +679,7 @@ diva_bri_start_adapter(PISDN_ADAPTER IoA
 	   wait for signature (max. 3 seconds)
 	 */
 	for (i = 0; i < 300; ++i) {
-		diva_os_wait(10);
+		mdelay(10);
 		outpp(addrHi,
 		      (byte) (
 			      (IoAdapter->MemoryBase +
@@ -721,7 +721,7 @@ diva_bri_start_adapter(PISDN_ADAPTER IoA
 
 	a->ram_out(a, &PR_RAM->ReadyInt, 1);
 	for (i = 0; ((!IoAdapter->IrqCount) && (i < 100)); i++) {
-		diva_os_wait(10);
+		mdelay(10);
 	}
 	if (!IoAdapter->IrqCount) {
 		DBG_ERR(
@@ -793,7 +793,7 @@ static int diva_bri_stop_adapter(diva_os
 	IoAdapter->a.ReadyInt = 1;
 	IoAdapter->a.ram_inc(&IoAdapter->a, &PR_RAM->ReadyInt);
 	do {
-		diva_os_sleep(10);
+		msleep(10);
 	} while (i-- && a->clear_interrupts_proc);
 	if (a->clear_interrupts_proc) {
 		diva_bri_clear_interrupts(a);

--===============24770439956871981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24770439956871981==--
