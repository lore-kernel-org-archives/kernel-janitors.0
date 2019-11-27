From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 27 Nov 2019 06:20:02 +0000
Subject: [PATCH -next] mtd: ubi: wl: remove set but not used variable 'prev_e'
Message-Id: <20191127062002.23746-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/mtd/ubi/wl.c: In function 'find_wl_entry':
drivers/mtd/ubi/wl.c:322:27: warning:
 variable 'prev_e' set but not used [-Wunused-but-set-variable]

It's not used any more now, so remove it.

Fixes: f9c34bb52997 ("ubi: Fix producing anchor PEBs")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mtd/ubi/wl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5d77a38dba54..837d690a8c60 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -319,7 +319,7 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 					  struct rb_root *root, int diff)
 {
 	struct rb_node *p;
-	struct ubi_wl_entry *e, *prev_e = NULL;
+	struct ubi_wl_entry *e;
 	int max;
 
 	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
@@ -334,7 +334,6 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 			p = p->rb_left;
 		else {
 			p = p->rb_right;
-			prev_e = e;
 			e = e1;
 		}
 	}
