From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 17:47:03 +0000
Subject: [Kernel-janitors] [PATCH] eicon/s_bri: replace schedule_timeout()
Message-Id: <20040723174703.GM1911@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46144672297353551=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46144672297353551==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace diva_os_sleep() with msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hardware/eicon/s_bri.c	2004-06-16 05:19:53.000000000 +0000
+++ linux-dev/drivers/isdn/hardware/eicon/s_bri.c	2004-07-02 18:11:16.000000000 +0000
@@ -367,7 +367,7 @@ static int load_bri_hardware (PISDN_ADAP
  addrHi =   Port + ((IoAdapter->Properties.Bus==BUS_PCI) ? M_PCI_ADDRH : ADDRH);
  addrLo = Port + ADDR ;
  ioaddr = Port + DATA ;
- diva_os_wait (100);
+ msleep (100);
 /*
  * recover
  */
@@ -382,7 +382,7 @@ static int load_bri_hardware (PISDN_ADAP
  outppw (addrLo, 0) ;
  for ( i = 0 ; i < 0x8000 ; outppw (ioaddr, 0), ++i ) ;
  DIVA_OS_MEM_DETACH_PORT(IoAdapter, Port);
- diva_os_wait (100) ;
+ msleep (100) ;
 /*
  * download protocol and dsp files
  */
@@ -445,7 +445,7 @@ static int load_bri_hardware (PISDN_ADAP
  ioaddr = Port + DATA ;
  for ( i = 0 ; i < 300 ; ++i )
  {
-  diva_os_wait (10) ;
+  msleep (10) ;
   outpp (addrHi, (byte)((BRI_UNCACHED_ADDR (IoAdapter->MemoryBase + \
       IoAdapter->MemorySize - BRI_SHARED_RAM_SIZE)) >> 16)) ;
   outppw (addrLo, 0x1e) ;

--===============46144672297353551==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46144672297353551==--
