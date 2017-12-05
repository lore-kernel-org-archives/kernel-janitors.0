From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:37:39 +0000
Subject: [PATCH] media: imx274: Silence uninitialized variable warning
Message-Id: <20171205143739.uoct55nitjrt4xun@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Leon Luo <leonl@leopardimaging.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "err" can be uninitialized if we have a zero size
write.  The flow analysis is a little complicated so I'm not sure if
that's possible or not, but it's harmless to set this to zero and it
makes the code easier to read.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 800b9bf9cdd3..e7c12933cfd2 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -634,7 +634,7 @@ static int imx274_regmap_util_write_table_8(struct regmap *regmap,
 					    const struct reg_8 table[],
 					    u16 wait_ms_addr, u16 end_addr)
 {
-	int err;
+	int err = 0;
 	const struct reg_8 *next;
 	u8 val;
 
