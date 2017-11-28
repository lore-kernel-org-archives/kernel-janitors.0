From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Nov 2017 19:30:21 +0000
Subject: [PATCH] regulator: lp8788: make various char arrays static const, shrinks object size
Message-Id: <20171128193021.25692-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milo Kim <milo.kim@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the read-only arrays b1_name and b2_name on the stack
but instead make them static and constify them.  Makes the object code
smaller by over 260 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   6961	   2256	      0	   9217	   2401	drivers/regulator/lp8788-buck.o

After:
   text	   data	    bss	    dec	    hex	filename
   6696	   2256	      0	   8952	   22f8	drivers/regulator/lp8788-buck.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/lp8788-buck.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/lp8788-buck.c b/drivers/regulator/lp8788-buck.c
index ec46290b647e..ab3a2138fb91 100644
--- a/drivers/regulator/lp8788-buck.c
+++ b/drivers/regulator/lp8788-buck.c
@@ -426,8 +426,10 @@ static int lp8788_dvs_gpio_request(struct platform_device *pdev,
 				enum lp8788_buck_id id)
 {
 	struct lp8788_platform_data *pdata = buck->lp->pdata;
-	char *b1_name = "LP8788_B1_DVS";
-	char *b2_name[] = { "LP8788_B2_DVS1", "LP8788_B2_DVS2" };
+	static const char * const b1_name = "LP8788_B1_DVS";
+	static const char * const b2_name[] = {
+		"LP8788_B2_DVS1", "LP8788_B2_DVS2"
+	};
 	int i, gpio, ret;
 
 	switch (id) {
-- 
2.14.1

