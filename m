From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 23:05:39 +0000
Subject: [KJ] [PATCH 7/15] FlashPoint: remove ushort_ptr
Message-Id: <200507070305.39975.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============023890497472938144=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============023890497472938144==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/scsi/FlashPoint.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

Index: linux-flashpoint/drivers/scsi/FlashPoint.c
===================================================================
--- linux-flashpoint.orig/drivers/scsi/FlashPoint.c	2005-07-06 23:46:25.000000000 +0400
+++ linux-flashpoint/drivers/scsi/FlashPoint.c	2005-07-06 23:47:18.000000000 +0400
@@ -42,7 +42,6 @@
 
 
 
-typedef unsigned short          * ushort_ptr;
 
 
 #define s08bits	char
@@ -6003,7 +6002,7 @@ static void FPT_scasid(unsigned char p_c
    unsigned char i,k,scam_id;
 	unsigned char crcBytes[3];
 	PNVRamInfo pCurrNvRam;
-	ushort_ptr pCrcBytes;
+	unsigned short * pCrcBytes;
 
 	pCurrNvRam = FPT_BL_Card[p_card].pNvRamInfo;
 
@@ -6023,7 +6022,7 @@ static void FPT_scasid(unsigned char p_c
       if (!(FPT_sciso(p_port,&temp_id_string[0])))
          {
 			if(pCurrNvRam){
-				pCrcBytes = (ushort_ptr)&crcBytes[0];
+				pCrcBytes = (unsigned short *)&crcBytes[0];
 				*pCrcBytes = FPT_CalcCrc16(&temp_id_string[0]);
 				crcBytes[2] = FPT_CalcLrc(&temp_id_string[0]);
 				temp_id_string[1] = crcBytes[2];

--===============023890497472938144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============023890497472938144==--
