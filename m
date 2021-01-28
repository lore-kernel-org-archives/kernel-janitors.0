From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2021 09:36:52 +0000
Subject: [PATCH] mtd: parser_imagetag: fix error codes in bcm963xx_parse_imagetag_partitions()
Message-Id: <YBKFtNaFHGYBj+u4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>

If the kstrtouint() calls fail, then this should return a negative
error code but it currently returns success.

Fixes: dd84cb022b31 ("mtd: bcm63xxpart: move imagetag parsing to its own parser")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/parsers/parser_imagetag.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index d69607b48227..fab0949aabba 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -83,6 +83,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid rootfs address: %*ph\n",
 				(int)sizeof(buf->flash_image_start),
 				buf->flash_image_start);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -92,6 +93,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid kernel address: %*ph\n",
 				(int)sizeof(buf->kernel_address),
 				buf->kernel_address);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -100,6 +102,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid kernel length: %*ph\n",
 				(int)sizeof(buf->kernel_length),
 				buf->kernel_length);
+			ret = -EINVAL;
 			goto out;
 		}
 
@@ -108,6 +111,7 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 			pr_err("invalid total length: %*ph\n",
 				(int)sizeof(buf->total_length),
 				buf->total_length);
+			ret = -EINVAL;
 			goto out;
 		}
 
-- 
2.29.2
