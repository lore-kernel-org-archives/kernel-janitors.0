From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:39 +0000
Subject: [PATCH 07/19] mmc: Change variable type to bool
Message-Id: <1379802471-30252-7-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cjb@laptop.org
Cc: tgih.jun@samsung.com, linkinjeon@gmail.com, kdorfman@codeaurora.org, ygardi@codeaurora.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The variable is_rpmb is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/mmc/card/block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
index 1a3163f..a5f5fb9 100644
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@ -451,7 +451,7 @@ static int mmc_blk_ioctl_cmd(struct block_device *bdev,
 	struct mmc_request mrq = {NULL};
 	struct scatterlist sg;
 	int err;
-	int is_rpmb = false;
+	bool is_rpmb = false;
 	u32 status = 0;
 
 	/*
-- 
1.8.3.1

