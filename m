From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 06 Dec 2020 12:13:04 +0000
Subject: [PATCH 1/2] interconnect: imx: Add a missing of_node_put after of_device_is_available
Message-Id: <20201206121304.29381-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: georgi.djakov@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, weiyongjun1@huawei.com, krzk@kernel.org, leonard.crestez@nxp.com, liushixin2@huawei.com, abailon@baylibre.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org

Add an 'of_node_put()' call when a tested device node is not available.

Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/interconnect/imx/imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
index 41dba7090c2a..e398ebf1dbba 100644
--- a/drivers/interconnect/imx/imx.c
+++ b/drivers/interconnect/imx/imx.c
@@ -99,6 +99,7 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 		if (!dn || !of_device_is_available(dn)) {
 			dev_warn(dev, "Missing property %s, skip scaling %s\n",
 				 adj->phandle_name, node->name);
+			of_node_put(dn);
 			return 0;
 		}
 
-- 
2.27.0
