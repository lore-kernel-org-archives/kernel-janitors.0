From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:14:57 +0000
Subject: [PATCH 01/25] r852: remove casts from void*
Message-Id: <1277806498-30738-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Maxim Levitsky <maximlevitsky@gmail.com>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>, David Woodhouse <dwmw2@infradead.org>

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/mtd/nand/r852.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/r852.c b/drivers/mtd/nand/r852.c
index 78a4232..c0a9835 100644
--- a/drivers/mtd/nand/r852.c
+++ b/drivers/mtd/nand/r852.c
@@ -64,8 +64,8 @@ static inline void r852_write_reg_dword(struct r852_device *dev,
 /* returns pointer to our private structure */
 static inline struct r852_device *r852_get_dev(struct mtd_info *mtd)
 {
-	struct nand_chip *chip = (struct nand_chip *)mtd->priv;
-	return (struct r852_device *)chip->priv;
+	struct nand_chip *chip = mtd->priv;
+	return chip->priv;
 }
 
 
-- 
1.7.0.4

