From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:43:23 +0000
Subject: [Kernel-janitors] [PATCH] eicon/os_pri: replace schedule_timeout()
Message-Id: <20040723174323.GJ1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60665069695770879=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60665069695770879==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep() and diva_os_wait()
with mdelay() in all instances. 

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/os_pri.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/os_pri.c	2004-07-02 18:08:55.000000000 +0000
@@ -349,12 +349,12 @@ static int diva_pri_reset_adapter(PISDN_
 
 	IoAdapter->rstFnc(IoAdapter);
 
-	diva_os_wait(10);
+	mdelay(10);
 
 	boot = (struct mp_load *) DIVA_OS_MEM_ATTACH_ADDRESS(IoAdapter);
 	i = READ_DWORD(&boot->live);
 
-	diva_os_wait(10);
+	mdelay(10);
 	if (i == READ_DWORD(&boot->live)) {
 		DIVA_OS_MEM_DETACH_ADDRESS(IoAdapter, boot);
 		DBG_ERR(("A: A(%d) CPU on PRI %ld is not alive!",
@@ -458,7 +458,7 @@ diva_pri_start_adapter(PISDN_ADAPTER IoA
 	WRITE_DWORD(&boot->cmd, 3);
 
 	for (i = 0; i < 300; ++i) {
-		diva_os_wait(10);
+		mdelay(10);
 		if ((READ_DWORD(&boot->signature) >> 16) == 0x4447) {
 			DBG_LOG(("A(%d) Protocol startup time %d.%02d seconds",
 				 IoAdapter->ANum, (i / 100), (i % 100)))
@@ -497,7 +497,7 @@ diva_pri_start_adapter(PISDN_ADAPTER IoA
 	a->ReadyInt = 1;
 	a->ram_out(a, &PR_RAM->ReadyInt, 1);
 
-	for (i = 100; !IoAdapter->IrqCount && (i-- > 0); diva_os_wait(10));
+	for (i = 100; !IoAdapter->IrqCount && (i-- > 0); mdelay(10));
 
 	if (!IoAdapter->IrqCount) {
 		DBG_ERR(("A: A(%d) interrupt test failed",
@@ -571,7 +571,7 @@ static int diva_pri_stop_adapter(diva_os
 	IoAdapter->a.ReadyInt = 1;
 	IoAdapter->a.ram_inc(&IoAdapter->a, &PR_RAM->ReadyInt);
 	do {
-		diva_os_sleep(10);
+		msleep(10);
 	} while (i-- && a->clear_interrupts_proc);
 
 	if (a->clear_interrupts_proc) {
@@ -972,7 +972,7 @@ static dword diva_pri_detect_dsps(diva_o
 	p = DIVA_OS_MEM_ATTACH_RESET(&a->xdi_adapter);
 	*(volatile byte *) p = _MP_RISC_RESET | _MP_DSP_RESET;
 	DIVA_OS_MEM_DETACH_RESET(&a->xdi_adapter, p);
-	diva_os_wait(5);
+	mdelay(5);
 
 	base = DIVA_OS_MEM_ATTACH_CONTROL(&a->xdi_adapter);
 
@@ -999,7 +999,7 @@ static dword diva_pri_detect_dsps(diva_o
 	p = DIVA_OS_MEM_ATTACH_RESET(&a->xdi_adapter);
 	*(volatile byte *) p = _MP_RISC_RESET | _MP_LED1 | _MP_LED2;
 	DIVA_OS_MEM_DETACH_RESET(&a->xdi_adapter, p);
-	diva_os_wait(5);
+	mdelay(5);
 
 	/*
 	   Verify modules

--===============60665069695770879==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60665069695770879==--
