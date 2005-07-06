From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 06 Jul 2005 23:04:01 +0000
Subject: [KJ] [PATCH 5/15] FlashPoint: remove UINT
Message-Id: <200507070304.01967.adobriyan@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52447807241272537=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52447807241272537==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/scsi/FlashPoint.c |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

Index: linux-flashpoint/drivers/scsi/FlashPoint.c
===================================================================
--- linux-flashpoint.orig/drivers/scsi/FlashPoint.c	2005-07-06 23:41:49.000000000 +0400
+++ linux-flashpoint/drivers/scsi/FlashPoint.c	2005-07-06 23:44:48.000000000 +0400
@@ -40,7 +40,6 @@
 #define FAILURE         0xFFFFFFFFL
 
 
-typedef unsigned int    UINT;
 typedef unsigned long   ULONG;
 
 
@@ -5205,7 +5204,7 @@ static void FPT_dataXferProcessor(ULONG 
 static void FPT_busMstrSGDataXferStart(ULONG p_port, PSCCB pcurrSCCB)
 {
    ULONG count,addr,tmpSGCnt;
-   UINT sg_index;
+   unsigned int sg_index;
    unsigned char sg_count, i;
    ULONG reg_offset;
 
@@ -5231,7 +5230,7 @@ static void FPT_busMstrSGDataXferStart(U
 	WR_HARPOON(p_port+hp_page_ctrl, i);
 
    while ((sg_count < (unsigned char)SG_BUF_CNT) &&
-      ((ULONG)(sg_index * (UINT)SG_ELEMENT_SIZE) < pcurrSCCB->DataLength) ) {
+      ((ULONG)(sg_index * (unsigned int)SG_ELEMENT_SIZE) < pcurrSCCB->DataLength) ) {
 
       tmpSGCnt += *(((ULONG *)pcurrSCCB->DataPointer)+
          (sg_index * 2));
@@ -5403,7 +5402,7 @@ static void FPT_hostDataXferAbort(ULONG 
 
    ULONG timeout;
    ULONG remain_cnt;
-   UINT sg_ptr;
+   unsigned int sg_ptr;
 
    FPT_BL_Card[p_card].globalFlags &= ~F_HOST_XFER_ACT;
 
@@ -5454,9 +5453,9 @@ static void FPT_hostDataXferAbort(ULONG 
 
          sg_ptr = pCurrSCCB->Sccb_sgseg + SG_BUF_CNT;
 
-         if (sg_ptr > (UINT)(pCurrSCCB->DataLength / SG_ELEMENT_SIZE)) {
+         if (sg_ptr > (unsigned int)(pCurrSCCB->DataLength / SG_ELEMENT_SIZE)) {
 
-            sg_ptr = (UINT)(pCurrSCCB->DataLength / SG_ELEMENT_SIZE);
+            sg_ptr = (unsigned int)(pCurrSCCB->DataLength / SG_ELEMENT_SIZE);
             }
 
          remain_cnt = pCurrSCCB->Sccb_XferCnt;
@@ -5659,7 +5658,7 @@ static void FPT_hostDataXferAbort(ULONG 
 static void FPT_hostDataXferRestart(PSCCB currSCCB)
 {
    ULONG data_count;
-   UINT  sg_index;
+   unsigned int  sg_index;
    ULONG *sg_ptr;
 
    if (currSCCB->Sccb_XferState & F_SG_XFER) {
@@ -7418,7 +7417,7 @@ static unsigned char FPT_queueFindSccb(P
 static void  FPT_utilUpdateResidual(PSCCB p_SCCB)
 {
    ULONG partial_cnt;
-   UINT  sg_index;
+   unsigned int  sg_index;
    ULONG *sg_ptr;
 
    if (p_SCCB->Sccb_XferState & F_ALL_XFERRED) {

--===============52447807241272537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52447807241272537==--
