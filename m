From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 16:10:28 +0000
Subject: [patch] i40e: precedence bug in i40e_get_pfc_delay()
Message-Id: <20141029161028.GE5290@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The ">>" operation has higher precedence than the "&" operation.  Also
the casting is not needed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is static checker work and I haven't tested it on real hardware.

diff --git a/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c b/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
index 00bc0cd..db9f9d3 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
@@ -40,8 +40,8 @@ static void i40e_get_pfc_delay(struct i40e_hw *hw, u16 *delay)
 	u32 val;
 
 	val = rd32(hw, I40E_PRTDCB_GENC);
-	*delay = (u16)(val & I40E_PRTDCB_GENC_PFCLDA_MASK >>
-		       I40E_PRTDCB_GENC_PFCLDA_SHIFT);
+	*delay = (val & I40E_PRTDCB_GENC_PFCLDA_MASK) >>
+		       I40E_PRTDCB_GENC_PFCLDA_SHIFT;
 }
 
 /**
