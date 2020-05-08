From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 08 May 2020 07:27:35 +0000
Subject: [PATCH net-next] nfp: abm: fix error return code in nfp_abm_vnic_alloc()
Message-Id: <20200508072735.61047-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>, Qiushi Wu <wu000273@umn.edu>, Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fix to return negative error code -ENOMEM from the kzalloc() error
handling case instead of 0, as done elsewhere in this function.

Fixes: 174ab544e3bc ("nfp: abm: add cls_u32 offload for simple band classification")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/netronome/nfp/abm/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/netronome/nfp/abm/main.c b/drivers/net/ethernet/netronome/nfp/abm/main.c
index 354efffac0f9..bdbf0726145e 100644
--- a/drivers/net/ethernet/netronome/nfp/abm/main.c
+++ b/drivers/net/ethernet/netronome/nfp/abm/main.c
@@ -333,8 +333,10 @@ nfp_abm_vnic_alloc(struct nfp_app *app, struct nfp_net *nn, unsigned int id)
 		goto err_free_alink;
 
 	alink->prio_map = kzalloc(abm->prio_map_len, GFP_KERNEL);
-	if (!alink->prio_map)
+	if (!alink->prio_map) {
+		err = -ENOMEM;
 		goto err_free_alink;
+	}
 
 	/* This is a multi-host app, make sure MAC/PHY is up, but don't
 	 * make the MAC/PHY state follow the state of any of the ports.
