From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:29:19 +0000
Subject: [patch] i40e: remove an unneeded check
Message-Id: <20140328082919.GM25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We know "ret" is zero here.  No need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 28da412..2640004 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -1534,12 +1534,12 @@ static int i40e_add_del_fdir_ethtool(struct i40e_vsi *vsi,
 		return ret;
 	}
 
-	if (!ret && add)
+	if (add)
 		i40e_update_ethtool_fdir_entry(vsi, input, fsp->location, NULL);
 	else
 		kfree(input);
 
-	return ret;
+	return 0;
 }
 
 /**
