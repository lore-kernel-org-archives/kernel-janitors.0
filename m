From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Dec 2015 12:59:43 +0000
Subject: [patch 2/2] regmap: missing case statement
Message-Id: <20151212125943.GB22043@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This new code is unreachable.  Presumably there was supposed to be a
case statement there similar to the earlier code.

Fixes: afcc00b91f18 ('regmap: add 64-bit mode support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 2d4cc70..026c44a 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -844,6 +844,7 @@ struct regmap *__regmap_init(struct device *dev,
 		}
 		break;
 #ifdef CONFIG_64BIT
+	case 64:
 		switch (val_endian) {
 		case REGMAP_ENDIAN_BIG:
 			map->format.format_val = regmap_format_64_be;
