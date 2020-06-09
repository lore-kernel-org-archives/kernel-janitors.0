From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Jun 2020 10:46:42 +0000
Subject: [PATCH] lib: devres: add a comment about the devm_of_iomap() function
Message-Id: <20200609104642.GA43074@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <AM6PR04MB496691DDA4447CD5624EE6E680850@AM6PR04MB4966.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Aisheng Dong <aisheng.dong@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Andrew Morton <akpm@linux-foundation.org>, Tuowen Zhao <ztuowen@gmail.com>, Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, BOUGH CHEN <haibo.chen@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

We recently introduced a bug when we tried to convert of_iomap() to
devm_of_iomap().  The problem was that there were two drivers mapping
the same io region.  The first driver was using of_iomap() and the
second driver was using devm_of_iomap() and the kernel booted fine.
When we converted the first drive to use devm_of_iomap() then the second
driver failed with -EBUSY and the kernel couldn't boot.

Let's add a comment to prevent this sort of mistake in the future.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/devres.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/devres.c b/lib/devres.c
index 6ef51f159c54b..0abe7c1cc4681 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -204,6 +204,12 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
  *	base = devm_of_iomap(&pdev->dev, node, 0, NULL);
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
+ *
+ * Please Note: This is not a one-to-one replacement for of_iomap() because the
+ * of_iomap() function does not track whether the region is already mapped.  If
+ * two drivers try to map the same memory, the of_iomap() function will succeed
+ * but the the devm_of_iomap() function will return -EBUSY.
+ *
  */
 void __iomem *devm_of_iomap(struct device *dev, struct device_node *node, int index,
 			    resource_size_t *size)
-- 
2.26.2
