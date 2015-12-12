From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Dec 2015 12:59:14 +0000
Subject: [patch 1/2] regmap: shift wrapping bugs in 64 bit code
Message-Id: <20151212125914.GA22043@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Xiubo Li <lixiubo@cmss.chinamobile.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should cast these to 64bit so that we don't truncate away the high
bits.

Fixes: afcc00b91f18 ('regmap: add 64-bit mode support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 1791180..2d4cc70 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -250,20 +250,20 @@ static void regmap_format_64_be(void *buf, unsigned int val, unsigned int shift)
 {
 	__be64 *b = buf;
 
-	b[0] = cpu_to_be64(val << shift);
+	b[0] = cpu_to_be64((u64)val << shift);
 }
 
 static void regmap_format_64_le(void *buf, unsigned int val, unsigned int shift)
 {
 	__le64 *b = buf;
 
-	b[0] = cpu_to_le64(val << shift);
+	b[0] = cpu_to_le64((u64)val << shift);
 }
 
 static void regmap_format_64_native(void *buf, unsigned int val,
 				    unsigned int shift)
 {
-	*(u64 *)buf = val << shift;
+	*(u64 *)buf = (u64)val << shift;
 }
 #endif
 
