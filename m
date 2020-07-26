From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 10:58:30 +0000
Subject: [PATCH 5/7] [media] saa7134: drop unnecessary list_empty
Message-Id: <1595761112-11003-6-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

list_for_each_safe is able to handle an empty list.
The only effect of avoiding the loop is not initializing the
index variable.
Drop list_empty tests in cases where these variables are not
used.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
expression x,e;
iterator name list_for_each_safe;
statement S;
identifier i,j;
@@

-if (!(list_empty(x))) {
   list_for_each_safe(i,j,x) S
- }
 ... when != i
     when != j
(
  i = e;
|
? j = e;
)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/pci/saa7134/saa7134-core.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index e4623ed..5095f25 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -359,14 +359,12 @@ void saa7134_stop_streaming(struct saa7134_dev *dev, struct saa7134_dmaqueue *q)
 	struct saa7134_buf *tmp;
 
 	spin_lock_irqsave(&dev->slock, flags);
-	if (!list_empty(&q->queue)) {
-		list_for_each_safe(pos, n, &q->queue) {
-			 tmp = list_entry(pos, struct saa7134_buf, entry);
-			 vb2_buffer_done(&tmp->vb2.vb2_buf,
-					 VB2_BUF_STATE_ERROR);
-			 list_del(pos);
-			 tmp = NULL;
-		}
+	list_for_each_safe(pos, n, &q->queue) {
+		tmp = list_entry(pos, struct saa7134_buf, entry);
+		vb2_buffer_done(&tmp->vb2.vb2_buf,
+				VB2_BUF_STATE_ERROR);
+		list_del(pos);
+		tmp = NULL;
 	}
 	spin_unlock_irqrestore(&dev->slock, flags);
 	saa7134_buffer_timeout(&q->timeout); /* also calls del_timer(&q->timeout) */
