From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Oct 2014 12:38:20 +0000
Subject: [patch] i40e: _MASK vs _SHIFT typo in i40e_handle_mdd_event()
Message-Id: <20141016123820.GA30053@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally mask by the _SHIFT variable.  It means that "event" is
always zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index ed5f1c1..c3a7f4a 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -6151,7 +6151,7 @@ static void i40e_handle_mdd_event(struct i40e_pf *pf)
 				I40E_GL_MDET_TX_PF_NUM_SHIFT;
 		u8 vf_num = (reg & I40E_GL_MDET_TX_VF_NUM_MASK) >>
 				I40E_GL_MDET_TX_VF_NUM_SHIFT;
-		u8 event = (reg & I40E_GL_MDET_TX_EVENT_SHIFT) >>
+		u8 event = (reg & I40E_GL_MDET_TX_EVENT_MASK) >>
 				I40E_GL_MDET_TX_EVENT_SHIFT;
 		u8 queue = (reg & I40E_GL_MDET_TX_QUEUE_MASK) >>
 				I40E_GL_MDET_TX_QUEUE_SHIFT;
@@ -6165,7 +6165,7 @@ static void i40e_handle_mdd_event(struct i40e_pf *pf)
 	if (reg & I40E_GL_MDET_RX_VALID_MASK) {
 		u8 func = (reg & I40E_GL_MDET_RX_FUNCTION_MASK) >>
 				I40E_GL_MDET_RX_FUNCTION_SHIFT;
-		u8 event = (reg & I40E_GL_MDET_RX_EVENT_SHIFT) >>
+		u8 event = (reg & I40E_GL_MDET_RX_EVENT_MASK) >>
 				I40E_GL_MDET_RX_EVENT_SHIFT;
 		u8 queue = (reg & I40E_GL_MDET_RX_QUEUE_MASK) >>
 				I40E_GL_MDET_RX_QUEUE_SHIFT;
