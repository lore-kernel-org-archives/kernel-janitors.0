From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:37:14 +0000
Subject: [Kernel-janitors] [PATCH] eicon/s_pri: replace schedule_timeout()
Message-Id: <20040723203714.GB2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85889322967701753=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723174733.GN1911@us.ibm.com>
In-Reply-To: <20040723174733.GN1911@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============85889322967701753==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Please find the corrected patch below and excuse my sending the same
patch twice. I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_wait() with mdelay().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/s_pri.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/s_pri.c	2004-07-02 18:12:41.000000000 +0000
@@ -91,9 +91,9 @@ static void pri_cpu_trapped (PISDN_ADAPT
 static void reset_pri_hardware (PISDN_ADAPTER IoAdapter) {
  byte *p = DIVA_OS_MEM_ATTACH_RESET(IoAdapter);
  *p = _MP_RISC_RESET | _MP_LED1 | _MP_LED2 ;
- diva_os_wait (50) ;
+ mdelay (50) ;
  *p = 0x00 ;
- diva_os_wait (50) ;
+ mdelay (50) ;
  DIVA_OS_MEM_DETACH_RESET(IoAdapter, p);
 }
 /* -------------------------------------------------------------------------
@@ -110,14 +110,14 @@ static void stop_pri_hardware (PISDN_ADA
  i = 0 ;
  while ( (i < 100) && (IoAdapter->a.ram_in (&IoAdapter->a, &RAM->SWReg) != 0) )
  {
-  diva_os_wait (1) ;
+  mdelay (1) ;
   i++ ;
  }
  DBG_TRC(("%s: PRI stopped (%d)", IoAdapter->Name, i))
  cfgReg = (dword volatile *)DIVA_OS_MEM_ATTACH_CFG(IoAdapter);
  WRITE_DWORD(&cfgReg[0],((dword)(~0x03E00000)));
  DIVA_OS_MEM_DETACH_CFG(IoAdapter, cfgReg);
- diva_os_wait (1) ;
+ mdelay (1) ;
  p = DIVA_OS_MEM_ATTACH_RESET(IoAdapter);
  *p = _MP_RISC_RESET | _MP_LED1 | _MP_LED2 ;
  DIVA_OS_MEM_DETACH_RESET(IoAdapter, p);
@@ -264,7 +264,7 @@ diva_pri_detect_dsps (PISDN_ADAPTER IoAd
   }
   *(volatile byte*)(p) = _MP_RISC_RESET | _MP_DSP_RESET;
   DIVA_OS_MEM_DETACH_RESET(IoAdapter, p);
-  diva_os_wait (5) ;
+  mdelay (5) ;
 
   base = DIVA_OS_MEM_ATTACH_CONTROL(IoAdapter);
   
@@ -286,7 +286,7 @@ diva_pri_detect_dsps (PISDN_ADAPTER IoAd
 
   p = DIVA_OS_MEM_ATTACH_RESET(IoAdapter);
   *(volatile byte*)(p) = _MP_RISC_RESET | _MP_LED1 | _MP_LED2;
-  diva_os_wait (50) ;
+  mdelay (50) ;
   /*
     Verify modules
   */
@@ -323,7 +323,7 @@ diva_pri_detect_dsps (PISDN_ADAPTER IoAd
   DBG_LOG(("DSP's(present-absent):%08x-%08x", ret, ~ret & 0x3fffffff))
   *(volatile byte*)(p) = 0 ;
   DIVA_OS_MEM_DETACH_RESET(IoAdapter, p);
-  diva_os_wait (50) ;
+  mdelay (50) ;
  IoAdapter->InitialDspInfo |= DspCount << 16 ;
   return (ret);
 }
@@ -421,9 +421,9 @@ static int load_pri_hardware (PISDN_ADAP
 /*
  * check if CPU is alive
  */
- diva_os_wait (10) ;
+ mdelay (10) ;
  i = boot->live ;
- diva_os_wait (10) ;
+ mdelay (10) ;
  if ( i == boot->live )
  {
   DIVA_OS_MEM_DETACH_RAM(IoAdapter, boot);
@@ -467,7 +467,7 @@ static int load_pri_hardware (PISDN_ADAP
  */
  for ( i = 0 ; i < 300 ; ++i )
  {
-  diva_os_wait (10) ;
+  mdelay (10) ;
   if ( (boot->signature >> 16) == 0x4447 )
   {
    DIVA_OS_MEM_DETACH_RAM(IoAdapter, boot);

--===============85889322967701753==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85889322967701753==--
