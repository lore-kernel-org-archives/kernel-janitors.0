From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Feb 2018 12:53:53 +0000
Subject: [PATCH] i40e: remove some stray indenting
Message-Id: <20180221125353.GA26904@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These two lines are indended too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 5cca083da93c..266a6beae881 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -3146,8 +3146,8 @@ static int i40e_vc_del_cloud_filter(struct i40e_vf *vf, u8 *msg)
 		dev_info(&pf->pdev->dev,
 			 "VF %d: Invalid input, can't apply cloud filter\n",
 			 vf->vf_id);
-			aq_ret = I40E_ERR_PARAM;
-			goto err;
+		aq_ret = I40E_ERR_PARAM;
+		goto err;
 	}
 
 	memset(&cfilter, 0, sizeof(cfilter));
