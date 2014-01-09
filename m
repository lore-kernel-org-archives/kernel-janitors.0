From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jan 2014 05:31:04 +0000
Subject: [patch] i40e: potential array underflow in i40e_vc_process_vf_msg()
Message-Id: <20140109053103.GD1265@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If "vf_id" is smaller than hw->func_caps.vf_base_id then we leads to an
array underflow of the pf->vf[] array.

Fixes: 7efa84b7abc1 ('i40e: support VFs on PFs other than 0')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 55ec2db71fa1..89482a078e9d 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -1698,7 +1698,7 @@ int i40e_vc_process_vf_msg(struct i40e_pf *pf, u16 vf_id, u32 v_opcode,
 			   u32 v_retval, u8 *msg, u16 msglen)
 {
 	struct i40e_hw *hw = &pf->hw;
-	int local_vf_id = vf_id - hw->func_caps.vf_base_id;
+	unsigned int local_vf_id = vf_id - hw->func_caps.vf_base_id;
 	struct i40e_vf *vf;
 	int ret;
 
