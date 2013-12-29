From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Dec 2013 21:53:09 +0000
Subject: [PATCH 15/25]  fix error return code
Message-Id: <1388357260-4843-18-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Set the return variable to an error code as done elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
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
Not tested.

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

