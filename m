From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 09 May 2020 02:58:28 +0000
Subject: [PATCH -next] interconnect: imx: Fix return value check in imx_icc_node_init_qos()
Message-Id: <20200509030214.14435-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgi Djakov <georgi.djakov@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Alexandre Bailon <abailon@baylibre.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, Hulk Robot <hulkci@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org

In case of error, the function of_parse_phandle() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/interconnect/imx/imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
index 6884212511f0..ac420f86008e 100644
--- a/drivers/interconnect/imx/imx.c
+++ b/drivers/interconnect/imx/imx.c
@@ -90,10 +90,10 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 			node->name, node->id);
 	} else {
 		dn = of_parse_phandle(dev->of_node, adj->phandle_name, 0);
-		if (IS_ERR(dn)) {
-			dev_warn(dev, "Failed to parse %s: %ld\n",
-				 adj->phandle_name, PTR_ERR(dn));
-			return PTR_ERR(dn);
+		if (!dn) {
+			dev_warn(dev, "Failed to parse %s\n",
+				 adj->phandle_name);
+			return -ENODEV;
 		}
 		/* Allow scaling to be disabled on a per-node basis */
 		if (!dn || !of_device_is_available(dn)) {
