From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 Jan 2014 09:58:42 +0000
Subject: [patch v2] i40e: potential array underflow in i40e_vc_process_vf_msg()
Message-Id: <20140111095841.GA12350@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "vf_id" is smaller than hw->func_caps.vf_base_id then it leads to
an array underflow of the pf->vf[] array.  This is unlikely to happen
unless the hardware is bad, but it's a small change and it silences a
static checker warning.

Fixes: 7efa84b7abc1 ('i40e: support VFs on PFs other than 0')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: rebased.  commit message updated.

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 51a4f6125437..b77d7e79d977 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -1772,7 +1772,7 @@ int i40e_vc_process_vf_msg(struct i40e_pf *pf, u16 vf_id, u32 v_opcode,
 			   u32 v_retval, u8 *msg, u16 msglen)
 {
 	struct i40e_hw *hw = &pf->hw;
-	int local_vf_id = vf_id - hw->func_caps.vf_base_id;
+	unsigned int local_vf_id = vf_id - hw->func_caps.vf_base_id;
 	struct i40e_vf *vf;
 	int ret;
 
