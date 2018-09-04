From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Sep 2018 14:15:53 +0000
Subject: [PATCH] mfd: arizona: make array mclk_name static, shrinks object size
Message-Id: <20180904141553.28000-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array mclk_name on the stack but instead make it
static. Makes the object code smaller by 23 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  38050	  11604	     64	  49718	   c236	linux/drivers/mfd/arizona-core.o

After:
   text	   data	    bss	    dec	    hex	filename
  38027	  11604	     64	  49695	   c21f	linux/drivers/mfd/arizona-core.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/arizona-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 5f1e37d23943..918d81a00b37 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -990,7 +990,7 @@ static const struct mfd_cell wm8998_devs[] = {
 
 int arizona_dev_init(struct arizona *arizona)
 {
-	const char * const mclk_name[] = { "mclk1", "mclk2" };
+	static const char * const mclk_name[] = { "mclk1", "mclk2" };
 	struct device *dev = arizona->dev;
 	const char *type_name = NULL;
 	unsigned int reg, val;
-- 
2.17.1
