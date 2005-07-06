From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 23:09:44 +0000
Subject: [KJ] [PATCH 10/15] FlashPoint: untypedef struct SCCBMgr_info
Message-Id: <200507070309.44440.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78827962095224713=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78827962095224713==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

* struct SCCBMgr_info => struct sccb_mgr_info
* PSCCBMGR_INFO => struct sccb_mgr_info *
* SCCBMGR_INFO => struct sccb_mgr_info

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/scsi/FlashPoint.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

Index: linux-flashpoint/drivers/scsi/FlashPoint.c
===================================================================
--- linux-flashpoint.orig/drivers/scsi/FlashPoint.c	2005-07-06 23:56:16.000000000 +0400
+++ linux-flashpoint/drivers/scsi/FlashPoint.c	2005-07-06 23:59:34.000000000 +0400
@@ -57,7 +57,7 @@ struct sccb;
 typedef void (*CALL_BK_FN)(struct sccb *);
 
 
-typedef struct SCCBMgr_info {
+struct sccb_mgr_info {
    unsigned long    si_baseaddr;
    unsigned char    si_present;
    unsigned char    si_intvect;
@@ -79,9 +79,8 @@ typedef struct SCCBMgr_info {
    unsigned char    si_XlatInfo[4];
    unsigned long    si_reserved2[5];
    unsigned long    si_secondary_range;
-} SCCBMGR_INFO;
+};
 
-typedef SCCBMGR_INFO *      PSCCBMGR_INFO;
 
 
 #define SCSI_PARITY_ENA		  0x0001
@@ -309,7 +308,7 @@ typedef NVRAMINFO *PNVRamInfo;
 
 typedef struct SCCBcard {
    struct sccb * currentSCCB;
-   PSCCBMGR_INFO cardInfo;
+   struct sccb_mgr_info * cardInfo;
 
    unsigned long ioPort;
 
@@ -1108,7 +1107,7 @@ static void (*FPT_s_PhaseTbl[8]) (unsign
  *
  *---------------------------------------------------------------------*/
 
-static int FlashPoint_ProbeHostAdapter(PSCCBMGR_INFO pCardInfo)
+static int FlashPoint_ProbeHostAdapter(struct sccb_mgr_info * pCardInfo)
 {
    static unsigned char first_time = 1;
 
@@ -1386,7 +1385,7 @@ static int FlashPoint_ProbeHostAdapter(P
  *
  *---------------------------------------------------------------------*/
 
-static unsigned long FlashPoint_HardwareResetHostAdapter(PSCCBMGR_INFO pCardInfo)
+static unsigned long FlashPoint_HardwareResetHostAdapter(struct sccb_mgr_info * pCardInfo)
 {
    PSCCBcard CurrCard = NULL;
 	PNVRamInfo pCurrNvRam;
@@ -7788,14 +7787,14 @@ static unsigned char FPT_CalcLrc(unsigne
 static inline unsigned char
 FlashPoint__ProbeHostAdapter(struct FlashPoint_Info *FlashPointInfo)
 {
-  return FlashPoint_ProbeHostAdapter((PSCCBMGR_INFO) FlashPointInfo);
+  return FlashPoint_ProbeHostAdapter((struct sccb_mgr_info *) FlashPointInfo);
 }
 
 
 static inline FlashPoint_CardHandle_T
 FlashPoint__HardwareResetHostAdapter(struct FlashPoint_Info *FlashPointInfo)
 {
-  return FlashPoint_HardwareResetHostAdapter((PSCCBMGR_INFO) FlashPointInfo);
+  return FlashPoint_HardwareResetHostAdapter((struct sccb_mgr_info *) FlashPointInfo);
 }
 
 static inline void

--===============78827962095224713==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78827962095224713==--
