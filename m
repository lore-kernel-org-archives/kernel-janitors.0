From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:40:06 +0000
Subject: [Kernel-janitors] [PATCH] eicon/os_bri: replace schedule_timeout()
Message-Id: <20040723174006.GE1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34214437187638058=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34214437187638058==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() and diva_os_wait()
with mdelay() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/os_4bri.c	2004-06-16 05:19:17.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/os_4bri.c	2004-07-02 18:06:40.000000000 +0000
@@ -543,7 +543,7 @@ static int _4bri_get_serial_number(diva_
 		for (j = 0; j < 5; ++j) {
 			PCIwrite(Bus, Slot, 0x4E, &addr, sizeof(addr),
 				 hdev);
-			diva_os_wait(1);
+			mdelay(1);
 			PCIread(Bus, Slot, 0x4E, &status, sizeof(status),
 				hdev);
 			if (status & 0x8000)
@@ -950,7 +950,7 @@ diva_4bri_start_adapter(PISDN_ADAPTER Io
 	signature = (volatile word *) (&p[0x1E]);
 
 	for (i = 0; i < 300; ++i) {
-		diva_os_wait(10);
+		mdelay(10);
 		if (READ_WORD(&signature[0]) == 0x4447) {
 			DBG_TRC(("Protocol startup time %d.%02d seconds",
 				 (i / 100), (i % 100)))
@@ -1027,7 +1027,7 @@ static int check_qBri_interrupt(PISDN_AD
 	a->ReadyInt = 1;
 	a->ram_out(a, &PR_RAM->ReadyInt, 1);
 
-	for (i = 100; !IoAdapter->IrqCount && (i-- > 0); diva_os_wait(10));
+	for (i = 100; !IoAdapter->IrqCount && (i-- > 0); mdelay(10));
 
 	return ((IoAdapter->IrqCount > 0) ? 0 : -1);
 #else
@@ -1050,7 +1050,7 @@ static int check_qBri_interrupt(PISDN_AD
 	p[PLX9054_INTCSR] = PLX9054_INT_ENABLE;
 	DIVA_OS_MEM_DETACH_RESET(IoAdapter, p);
 
-	diva_os_wait(100);
+	mdelay(100);
 
 	return (0);
 #endif				/* SUPPORT_INTERRUPT_TEST_ON_4BRI */
@@ -1111,7 +1111,7 @@ static int diva_4bri_stop_adapter(diva_o
 	IoAdapter->a.ReadyInt = 1;
 	IoAdapter->a.ram_inc(&IoAdapter->a, &PR_RAM->ReadyInt);
 	do {
-		diva_os_sleep(10);
+		msleep(10);
 	} while (i-- && a->clear_interrupts_proc);
 
 	if (a->clear_interrupts_proc) {

--===============34214437187638058==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34214437187638058==--
