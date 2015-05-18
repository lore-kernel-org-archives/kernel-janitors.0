From: Joe Perches <joe@perches.com>
Date: Mon, 18 May 2015 17:01:03 +0000
Subject: [PATCH] regulator: max77686: fix gpio_enabled shift wrapping bug
Message-Id: <1431968463.2870.34.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150515092501.GB21508@mwanda> <5555C814.7030405@samsung.com>
In-Reply-To: <5555C814.7030405@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code should handle more than 32 bits here because "id"
can be a value up to MAX77686_REGULATORS (currently 34).

Convert the gpio_enabled type to DECLARE_BITMAP and use
test_bit/set_bit.

Fixes: 3307e9025d29 ("regulator: max77686: Add GPIO control")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/regulator/max77686.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index 23b7c06..17ccf36 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -88,7 +88,7 @@ enum max77686_ramp_rate {
 };
 
 struct max77686_data {
-	u64 gpio_enabled:MAX77686_REGULATORS;
+	DECLARE_BITMAP(gpio_enabled, MAX77686_REGULATORS);
 
 	/* Array indexed by regulator id */
 	unsigned int opmode[MAX77686_REGULATORS];
@@ -121,7 +121,7 @@ static unsigned int max77686_map_normal_mode(struct max77686_data *max77686,
 	case MAX77686_BUCK8:
 	case MAX77686_BUCK9:
 	case MAX77686_LDO20 ... MAX77686_LDO22:
-		if (max77686->gpio_enabled & (1 << id))
+		if (test_bit(id, max77686->gpio_enabled))
 			return MAX77686_GPIO_CONTROL;
 	}
 
@@ -277,7 +277,7 @@ static int max77686_of_parse_cb(struct device_node *np,
 	}
 
 	if (gpio_is_valid(config->ena_gpio)) {
-		max77686->gpio_enabled |= (1 << desc->id);
+		set_bit(desc->id, max77686->gpio_enabled);
 
 		return regmap_update_bits(config->regmap, desc->enable_reg,
 					  desc->enable_mask,




