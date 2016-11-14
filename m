From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Nov 2016 11:31:34 +0000
Subject: [patch] mmc: mmc_test: Uninitialized return value
Message-Id: <20161114113134.GA20543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>, Per Forlin <per.forlin@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We never set "ret" to RESULT_OK.

Fixes: 9f9c4180f88d ("mmc: mmc_test: add test for non-blocking transfers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/card/mmc_test.c b/drivers/mmc/card/mmc_test.c
index f61c812..5ba6d77 100644
--- a/drivers/mmc/card/mmc_test.c
+++ b/drivers/mmc/card/mmc_test.c
@@ -832,7 +832,7 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
 	struct mmc_async_req *other_areq = &test_areq[1].areq;
 	enum mmc_blk_status status;
 	int i;
-	int ret;
+	int ret = RESULT_OK;
 
 	test_areq[0].test = test;
 	test_areq[1].test = test;
