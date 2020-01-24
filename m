From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jan 2020 10:13:12 +0000
Subject: [PATCH] dma-buf: fix locking in sync_print_obj()
Message-Id: <20200124101311.drryaegcdc7d4x7e@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Semwal <sumit.semwal@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Gustavo Padovan <gustavo.padovan@collabora.com>, Sean Paul <seanpaul@chromium.org>, linux-media@vger.kernel.org

This is always called with IRQs disabled and we don't actually want to
enable IRQs at the end.

Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma-buf/sync_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 101394f16930..952331344b1c 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -107,15 +107,16 @@ static void sync_print_fence(struct seq_file *s,
 static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
 {
 	struct list_head *pos;
+	unsigned long flags;
 
 	seq_printf(s, "%s: %d\n", obj->name, obj->value);
 
-	spin_lock_irq(&obj->lock);
+	spin_lock_irqsave(&obj->lock, flags);
 	list_for_each(pos, &obj->pt_list) {
 		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
 		sync_print_fence(s, &pt->base, false);
 	}
-	spin_unlock_irq(&obj->lock);
+	spin_unlock_irqrestore(&obj->lock, flags);
 }
 
 static void sync_print_sync_file(struct seq_file *s,
-- 
2.11.0
