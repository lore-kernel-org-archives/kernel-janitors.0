From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 May 2018 10:56:55 +0000
Subject: [PATCH] staging: wilc1000: allocate less memory
Message-Id: <20180503105655.GC5315@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should be allocating space for hidden_network_info structs.  They are
slightly smaller than hidden_network structs.  This bug doesn't cause a
runtime issue beyond the very small ammount of extra memory used.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
index 3ca0c97b0627..92322d6f061d 100644
--- a/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
+++ b/drivers/staging/wilc1000/wilc_wfi_cfgoperations.c
@@ -581,8 +581,8 @@ wilc_wfi_cfg_alloc_fill_ssid(struct cfg80211_scan_request *request,
 	int i;
 	int slot_id = 0;
 
-	ntwk->net_info = kcalloc(request->n_ssids,
-				 sizeof(struct hidden_network), GFP_KERNEL);
+	ntwk->net_info = kcalloc(request->n_ssids, sizeof(*ntwk->net_info),
+				 GFP_KERNEL);
 	if (!ntwk->net_info)
 		goto out;
 
