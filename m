From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Aug 2020 07:50:52 +0000
Subject: [PATCH][next] soc: ti: omap-prm: fix spelling mistake "unusupported" -> "unsupported"
Message-Id: <20200819075052.48833-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn warning. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/soc/ti/omap_prm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index 980b04c38fd9..30862fc174ae 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -343,7 +343,7 @@ static int omap_prm_domain_attach_dev(struct generic_pm_domain *domain,
 		return ret;
 
 	if (pd_args.args_count != 0)
-		dev_warn(dev, "%s: unusupported #power-domain-cells: %i\n",
+		dev_warn(dev, "%s: unsupported #power-domain-cells: %i\n",
 			 prmd->pd.name, pd_args.args_count);
 
 	genpd_data = dev_gpd_data(dev);
-- 
2.27.0
