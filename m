From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 Jan 2018 15:10:40 +0000
Subject: [PATCH 4/5] mtd/rfd_ftl: Return directly after a failed kmalloc() in erase_block()
Message-Id: <7b381eef-c54f-d2c9-7281-a90d519c22f1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
In-Reply-To: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 15:18:28 +0100

* Return directly after a call of the function "kmalloc" failed
  at the beginning.

* Delete an initialisation for the variable "rc" and the jump label "err"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index dcf1b88e1193..e3155ec4be64 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -323,11 +323,11 @@ static void erase_callback(struct erase_info *erase)
 
 static int erase_block(struct partition *part, int block)
 {
-	int rc = -ENOMEM;
+	int rc;
 	struct erase_info *erase = kmalloc(sizeof(*erase), GFP_KERNEL);
 
 	if (!erase)
-		goto err;
+		return -ENOMEM;
 
 	erase->mtd = part->mbd.mtd;
 	erase->callback = erase_callback;
@@ -346,8 +346,6 @@ static int erase_block(struct partition *part, int block)
 				(unsigned long long)erase->len, part->mbd.mtd->name);
 		kfree(erase);
 	}
-
-err:
 	return rc;
 }
 
-- 
2.15.1

