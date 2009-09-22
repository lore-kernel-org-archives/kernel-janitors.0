From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Sep 2009 16:03:17 +0000
Subject: [PATCH] drivers/video/sis: change the field used with the VB_SISLVDS
Message-Id: <Pine.LNX.4.64.0909221802310.20456@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas@winischhofer.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The constant VB_SISLVDS and other VB_ constants are used elsewhere in this
file with the SiS_VBType field, not the SiS_VBInfo field.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/video/sis/init301.c         |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/sis/init301.c b/drivers/video/sis/init301.c
index da33d80..8b5201b 100644
--- a/drivers/video/sis/init301.c
+++ b/drivers/video/sis/init301.c
@@ -5848,7 +5848,7 @@ SiS_SetGroup1_LVDS(struct SiS_Private *SiS_Pr, unsigned short ModeNo, unsigned s
 #ifdef SIS315H
   if(SiS_Pr->ChipType >= SIS_315H) {
      if(SiS_Pr->SiS_VBInfo & SetCRT2ToLCDA) {
-        if((islvds) || (SiS_Pr->SiS_VBInfo & VB_SISLVDS)) {
+	 if ((islvds) || (SiS_Pr->SiS_VBType & VB_SISLVDS)) {
            SiS_SetReg(SiS_Pr->SiS_Part1Port,0x1e,0x20);
 	}
      } else {
