From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 06 Dec 2020 12:13:22 +0000
Subject: [PATCH 2/2] interconnect: imx: Remove a useless test
Message-Id: <20201206121322.29434-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: georgi.djakov@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, weiyongjun1@huawei.com, krzk@kernel.org, leonard.crestez@nxp.com, liushixin2@huawei.com, abailon@baylibre.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org

'dn' can't be NULL here, it is tested just the line above.
Remove this useless test.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/interconnect/imx/imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
index e398ebf1dbba..c770951a909c 100644
--- a/drivers/interconnect/imx/imx.c
+++ b/drivers/interconnect/imx/imx.c
@@ -96,7 +96,7 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 			return -ENODEV;
 		}
 		/* Allow scaling to be disabled on a per-node basis */
-		if (!dn || !of_device_is_available(dn)) {
+		if (!of_device_is_available(dn)) {
 			dev_warn(dev, "Missing property %s, skip scaling %s\n",
 				 adj->phandle_name, node->name);
 			of_node_put(dn);
-- 
2.27.0
