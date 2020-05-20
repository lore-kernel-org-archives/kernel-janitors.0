From: Walter Harms <wharms@bfs.de>
Date: Wed, 20 May 2020 07:18:35 +0000
Subject: AW: [PATCH 1/2 v3] net: ethernet: ti: fix some return value check of cpsw_ale_create()
Message-Id: <2ff811c27a7e43a2a6f2b1744a735f26@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520034116.170946-1-weiyongjun1@huawei.com>,<20200520034116.170946-2-weiyongjun1@huawei.com>
In-Reply-To: <20200520034116.170946-2-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

just a notice:

from my casual observation i noticed that most people expect
a function to return NULL on error (as seen here). So i would suggest
to return NULL and (if needed) the error code otherwise.

jm2c,
re
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org <kernel-janitors-owner@vger.kernel.org> im Auftrag von Wei Yongjun <weiyongjun1@huawei.com>
Gesendet: Mittwoch, 20. Mai 2020 05:41:15
An: netdev@vger.kernel.org; Grygorii Strashko; Christophe JAILLET; Colin Ian King; Jakub Kicinski
Cc: Wei Yongjun; kernel-janitors@vger.kernel.org; Hulk Robot
Betreff: [PATCH 1/2 v3] net: ethernet: ti: fix some return value check of cpsw_ale_create()

cpsw_ale_create() can return both NULL and PTR_ERR(), but all of
the caller only check NULL for error handling. This patch convert
it to only return PTR_ERR() in all error cases, and the caller using
IS_ERR() instead of NULL test.

Fixes: 4b41d3436796 ("net: ethernet: ti: cpsw: allow untagged traffic on host port")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/ti/cpsw_ale.c    | 2 +-
 drivers/net/ethernet/ti/cpsw_priv.c   | 4 ++--
 drivers/net/ethernet/ti/netcp_ethss.c | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
index 0374e6936091..8dc6be11b2ff 100644
--- a/drivers/net/ethernet/ti/cpsw_ale.c
+++ b/drivers/net/ethernet/ti/cpsw_ale.c
@@ -955,7 +955,7 @@ struct cpsw_ale *cpsw_ale_create(struct cpsw_ale_params *params)

        ale = devm_kzalloc(params->dev, sizeof(*ale), GFP_KERNEL);
        if (!ale)
-               return NULL;
+               return ERR_PTR(-ENOMEM);

        ale->p0_untag_vid_mask =
                devm_kmalloc_array(params->dev, BITS_TO_LONGS(VLAN_N_VID),
diff --git a/drivers/net/ethernet/ti/cpsw_priv.c b/drivers/net/ethernet/ti/cpsw_priv.c
index 97a058ca60ac..d0b6c418a870 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.c
+++ b/drivers/net/ethernet/ti/cpsw_priv.c
@@ -490,9 +490,9 @@ int cpsw_init_common(struct cpsw_common *cpsw, void __iomem *ss_regs,
        ale_params.ale_ports            = CPSW_ALE_PORTS_NUM;

        cpsw->ale = cpsw_ale_create(&ale_params);
-       if (!cpsw->ale) {
+       if (IS_ERR(cpsw->ale)) {
                dev_err(dev, "error initializing ale engine\n");
-               return -ENODEV;
+               return PTR_ERR(cpsw->ale);
        }

        dma_params.dev          = dev;
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index fb36115e9c51..fdbae734acce 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -3704,9 +3704,9 @@ static int gbe_probe(struct netcp_device *netcp_device, struct device *dev,
                ale_params.nu_switch_ale = true;
        }
        gbe_dev->ale = cpsw_ale_create(&ale_params);
-       if (!gbe_dev->ale) {
+       if (IS_ERR(gbe_dev->ale)) {
                dev_err(gbe_dev->dev, "error initializing ale engine\n");
-               ret = -ENODEV;
+               ret = PTR_ERR(gbe_dev->ale);
                goto free_sec_ports;
        } else {
                dev_dbg(gbe_dev->dev, "Created a gbe ale engine\n");
--
2.25.1
