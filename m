From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 18 Jan 2018 13:59:11 +0000
Subject: [PATCH -next] mtd: ubi: wl: Fix error return code in ubi_wl_init()
Message-Id: <1516284305-82544-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the kmem_cache_alloc() error
handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mtd/ubi/wl.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 77ab49f..2052a64 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1617,8 +1617,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-		if (!e)
+		if (!e) {
+			err = -ENOMEM;
 			goto out_free;
+		}
 
 		e->pnum = aeb->pnum;
 		e->ec = aeb->ec;
@@ -1637,8 +1639,10 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			cond_resched();
 
 			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-			if (!e)
+			if (!e) {
+				err = -ENOMEM;
 				goto out_free;
+			}
 
 			e->pnum = aeb->pnum;
 			e->ec = aeb->ec;

