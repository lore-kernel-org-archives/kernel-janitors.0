From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:46:38 +0000
Subject: [Kernel-janitors] [PATCH] eicon/s_4bri: replace schedule_timeout()
Message-Id: <20040723174638.GL1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51276077541717635=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51276077541717635==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/s_4bri.c	2004-06-16 05:18:37.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/s_4bri.c	2004-07-02 18:10:53.000000000 +0000
@@ -104,13 +104,13 @@ static void reset_qBri_hardware (PISDN_A
 
 	qBriReset = (word volatile *)DIVA_OS_MEM_ATTACH_PROM(IoAdapter);
 	WRITE_WORD(qBriReset, READ_WORD(qBriReset) | PLX9054_SOFT_RESET) ;
-	diva_os_wait (1) ;
+	msleep (1) ;
 	WRITE_WORD(qBriReset, READ_WORD(qBriReset) & ~PLX9054_SOFT_RESET) ;
-	diva_os_wait (1);
+	msleep (1);
 	WRITE_WORD(qBriReset, READ_WORD(qBriReset) | PLX9054_RELOAD_EEPROM) ;
-	diva_os_wait (1) ;
+	msleep (1);
 	WRITE_WORD(qBriReset, READ_WORD(qBriReset) & ~PLX9054_RELOAD_EEPROM) ;
-	diva_os_wait (1);
+	msleep (1);
 	DIVA_OS_MEM_DETACH_PROM(IoAdapter, qBriReset);
 
 	qBriCntrl = DIVA_OS_MEM_ATTACH_CTLREG(IoAdapter);
@@ -132,9 +132,9 @@ void start_qBri_hardware (PISDN_ADAPTER 
 	p = (byte volatile *)DIVA_OS_MEM_ATTACH_CTLREG(IoAdapter);
 	qBriReset = &p[(DIVA_4BRI_REVISION(IoAdapter)) ? (MQ2_BREG_RISC) : (MQ_BREG_RISC)];
 	WRITE_DWORD(qBriReset, MQ_RISC_COLD_RESET_MASK) ;
-	diva_os_wait (2) ;
+	msleep (2) ;
 	WRITE_DWORD(qBriReset, MQ_RISC_WARM_RESET_MASK | MQ_RISC_COLD_RESET_MASK) ;
-	diva_os_wait (10) ;
+	msleep (10) ;
 	DIVA_OS_MEM_DETACH_CTLREG(IoAdapter, p);
 
 	DBG_TRC(("started processor @ addr 0x%08lx", qBriReset))
@@ -316,7 +316,7 @@ int qBri_FPGA_download (PISDN_ADAPTER Io
  */
 	WRITE_WORD(addr, baseval & ~FPGA_PROG) ; /* PROGRAM low pulse */
 	WRITE_WORD(addr, baseval) ;              /* release */
-	diva_os_wait (50) ;  /* wait until FPGA finished internal memory clear */
+	msleep (50) ;  /* wait until FPGA finished internal memory clear */
 /*
  *	check done pin, must be low
  */
@@ -345,7 +345,7 @@ int qBri_FPGA_download (PISDN_ADAPTER Io
 		}
 	}
 	xdiFreeFile (File) ;
-	diva_os_wait (100) ;
+	msleep (100) ;
 	val = READ_WORD(addr) ;
 
 	DIVA_OS_MEM_DETACH_PROM(IoAdapter, addr);
@@ -837,7 +837,7 @@ static int load_qBri_hardware (PISDN_ADA
  */
 	for ( i = 0 ; i < 300 ; ++i )
 	{
-		diva_os_wait (10) ;
+		msleep (10) ;
 
 		if ( signature[0] == 0x4447 )
 		{

--===============51276077541717635==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51276077541717635==--
