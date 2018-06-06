From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Jun 2018 23:34:02 +0000
Subject: [PATCH] staging: rtl8723bs: drop test
Message-Id: <1528328042-6461-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hdegoede@redhat.com
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The test selects between two identical values, so it doesn't look useful.
It turns out that the tested expression can only be true anyway, so drop
the test, the corresponding parameter, and the corresponding argument at
the only call site.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
@@

* e ? e1 : e1
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 2ee25b2..53d3bdf 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1352,7 +1352,6 @@ static void _PHY_ReloadMACRegisters8723B(
 static void _PHY_PathADDAOn8723B(
 	struct adapter *padapter,
 	u32 *ADDAReg,
-	bool isPathAOn,
 	bool is2T
 )
 {
@@ -1363,7 +1362,7 @@ static void _PHY_PathADDAOn8723B(
 
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD, ("ADDA ON.\n"));
 
-	pathOn = isPathAOn ? 0x01c00014 : 0x01c00014;
+	pathOn = 0x01c00014;
 	if (false = is2T) {
 		pathOn = 0x01c00014;
 		PHY_SetBBReg(pDM_Odm->Adapter, ADDAReg[0], bMaskDWord, 0x01c00014);
@@ -1556,7 +1555,7 @@ static void phy_IQCalibrate_8723B(
 	}
 	ODM_RT_TRACE(pDM_Odm, ODM_COMP_CALIBRATION, ODM_DBG_LOUD, ("IQ Calibration for %s for %d times\n", (is2T ? "2T2R" : "1T1R"), t));
 
-	_PHY_PathADDAOn8723B(padapter, ADDA_REG, true, is2T);
+	_PHY_PathADDAOn8723B(padapter, ADDA_REG, is2T);
 
 /* no serial mode */
 

