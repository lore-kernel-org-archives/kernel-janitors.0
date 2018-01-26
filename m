From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 26 Jan 2018 22:13:44 +0000
Subject: [PATCH] regulator: of: Add a missing 'of_node_put()' in an error handling path of 'of_regulator_matc
Message-Id: <20180126221344.32314-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an unlikely failure in 'of_get_regulator_init_data()' occurs, we must
release the reference on the current 'child' node before returning.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/regulator/of_regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 41dad42b18f0..532a9a3d5f9b 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -307,6 +307,7 @@ int of_regulator_match(struct device *dev, struct device_node *node,
 				dev_err(dev,
 					"failed to parse DT for regulator %s\n",
 					child->name);
+				of_node_put(child);
 				return -EINVAL;
 			}
 			match->of_node = of_node_get(child);
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

