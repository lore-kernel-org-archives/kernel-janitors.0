From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 08:00:28 +0000
Subject: [PATCH 2/3] regulator/core: Improve a size determination in four functions
Message-Id: <43dd60ac-bd16-76aa-ea71-f4e647b54ad3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
In-Reply-To: <471498fb-58af-46d4-2150-614c0f9cdc22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 22:30:10 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/regulator/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 14fdf2f17a62..28859c186c9f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1223,7 +1223,7 @@ static int set_consumer_device_supply(struct regulator_dev *rdev,
 		return -EBUSY;
 	}
 
-	node = kzalloc(sizeof(struct regulator_map), GFP_KERNEL);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (node = NULL)
 		return -ENOMEM;
 
@@ -1833,7 +1833,7 @@ int regulator_register_supply_alias(struct device *dev, const char *id,
 	if (map)
 		return -EEXIST;
 
-	map = kzalloc(sizeof(struct regulator_supply_alias), GFP_KERNEL);
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (!map)
 		return -ENOMEM;
 
@@ -1964,7 +1964,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 	if (ret)
 		return ret;
 
-	pin = kzalloc(sizeof(struct regulator_enable_gpio), GFP_KERNEL);
+	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
 	if (pin = NULL) {
 		gpio_free(config->ena_gpio);
 		return -ENOMEM;
@@ -4011,7 +4011,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		return ERR_PTR(-EINVAL);
 	}
 
-	rdev = kzalloc(sizeof(struct regulator_dev), GFP_KERNEL);
+	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
 	if (rdev = NULL)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.14.3

