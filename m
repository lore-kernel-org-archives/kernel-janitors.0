From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 20 Nov 2014 17:33:57 +0000
Subject: [PATCH 1/7] umem: fix error return code
Message-Id: <1416504842-18548-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416504842-18548-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series are independent of each other.

 drivers/block/umem.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index 4cf81b5..371e819 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -881,6 +881,7 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (card->mm_pages[0].desc = NULL ||
 	    card->mm_pages[1].desc = NULL) {
 		dev_printk(KERN_ERR, &card->dev->dev, "alloc failed\n");
+		ret = -ENOMEM;
 		goto failed_alloc;
 	}
 	reset_page(&card->mm_pages[0]);
@@ -891,8 +892,10 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	card->biotail = &card->bio;
 
 	card->queue = blk_alloc_queue(GFP_KERNEL);
-	if (!card->queue)
+	if (!card->queue) {
+		ret = -ENOMEM;
 		goto failed_alloc;
+	}
 
 	blk_queue_make_request(card->queue, mm_make_request);
 	card->queue->queue_lock = &card->lock;

