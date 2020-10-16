From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Oct 2020 22:22:35 +0000
Subject: [PATCH] regulator: lp872x: make a const array static, makes object smaller
Message-Id: <20201016222235.686981-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array lp872x_num_regulators  on the stack but
instead make it static. Makes the object code smaller by 29 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  18441	   4624	     64	  23129	   5a59	drivers/regulator/lp872x.o

After:
   text	   data	    bss	    dec	    hex	filename
  18316	   4720	     64	  23100	   5a3c	drivers/regulator/lp872x.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/lp872x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 303d7e2dc838..e84be29533f4 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -892,7 +892,7 @@ static int lp872x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	struct lp872x *lp;
 	struct lp872x_platform_data *pdata;
 	int ret;
-	const int lp872x_num_regulators[] = {
+	static const int lp872x_num_regulators[] = {
 		[LP8720] = LP8720_NUM_REGULATORS,
 		[LP8725] = LP8725_NUM_REGULATORS,
 	};
-- 
2.27.0
