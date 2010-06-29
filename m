From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:20 +0000
Subject: [PATCH 07/25] r852: remove casts from void*
Message-Id: <1277806521-30942-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/r852.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index c0a9835..43f0366 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -380,7 +380,7 @@ void r852_cmdctl(struct mtd_info *mtd, int dat, unsigned int ctrl)
  */
 int r852_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct r852_device *dev = (struct r852_device *)chip->priv;
+	struct r852_device *dev = chip->priv;
 
 	unsigned long timeout;
 	int status;
-- 
1.7.0.4

