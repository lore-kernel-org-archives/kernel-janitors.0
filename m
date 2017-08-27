From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 27 Aug 2017 10:06:50 +0000
Subject: [PATCH 1/2] bus: arm-ccn: Check memory allocation failure
Message-Id: <20170827100650.13236-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Check memory allocation failures and return -ENOMEM in such cases

This avoids a potential NULL pointer dereference.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bus/arm-ccn.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bus/arm-ccn.c b/drivers/bus/arm-ccn.c
index e8c6946fed9d..c0e851a0a3d7 100644
--- a/drivers/bus/arm-ccn.c
+++ b/drivers/bus/arm-ccn.c
@@ -1271,6 +1271,10 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
 		int len = snprintf(NULL, 0, "ccn_%d", ccn->dt.id);
 
 		name = devm_kzalloc(ccn->dev, len + 1, GFP_KERNEL);
+		if (!name) {
+			err = -ENOMEM;
+			goto error_choose_name;
+		}
 		snprintf(name, len + 1, "ccn_%d", ccn->dt.id);
 	}
 
@@ -1318,6 +1322,7 @@ static int arm_ccn_pmu_init(struct arm_ccn *ccn)
 
 error_pmu_register:
 error_set_affinity:
+error_choose_name:
 	ida_simple_remove(&arm_ccn_pmu_ida, ccn->dt.id);
 	for (i = 0; i < ccn->num_xps; i++)
 		writel(0, ccn->xp[i].base + CCN_XP_DT_CONTROL);
-- 
2.11.0

