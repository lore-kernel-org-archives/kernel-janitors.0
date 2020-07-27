From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 11:23:16 +0000
Subject: [PATCH] counter: microchip-tcb-capture: check the correct variable
Message-Id: <20200727112316.GG389488@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be testing "regmap" instead of "priv->regmap".  The
"priv->regmap" variable is always zero so it's not an error pointer.

Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The commit 106b104137fd ("counter: Add microchip TCB capture counter")
doesn't use the correct patch prefix.  This is a common mistake for the
the first commit which adds the driver.  There is no kernel wide
standard for patch prefixes so it's difficult for people sending fixes
to know the correct prefix should be.

 drivers/counter/microchip-tcb-capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index f7b7743ddb94..b7b252c5addf 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -320,8 +320,8 @@ static int mchp_tc_probe(struct platform_device *pdev)
 	}
 
 	regmap = syscon_node_to_regmap(np->parent);
-	if (IS_ERR(priv->regmap))
-		return PTR_ERR(priv->regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	/* max. channels number is 2 when in QDEC mode */
 	priv->num_channels = of_property_count_u32_elems(np, "reg");
-- 
2.27.0
