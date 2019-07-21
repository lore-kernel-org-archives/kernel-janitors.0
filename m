From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 17:08:24 +0000
Subject: [PATCH] staging: unisys: visornic: Update the description of 'poll_for_irq()'
Message-Id: <20190721170824.3412-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Commit e99e88a9d2b06 ("treewide: setup_timer() -> timer_setup()") has
updated the parameters of 'poll_for_irq()' but not the comment above the
function.

Update the comment and fix a typo.
s/visronic/visornic/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/unisys/visornic/visornic_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/staging/unisys/visornic/visornic_main.c
index 9d4f1dab0968..40dd573e73c3 100644
--- a/drivers/staging/unisys/visornic/visornic_main.c
+++ b/drivers/staging/unisys/visornic/visornic_main.c
@@ -1750,7 +1750,8 @@ static int visornic_poll(struct napi_struct *napi, int budget)
 }
 
 /* poll_for_irq	- checks the status of the response queue
- * @v: Void pointer to the visronic devdata struct.
+ * @t: pointer to the 'struct timer_list' from which we can retrieve the
+ *     the visornic devdata struct.
  *
  * Main function of the vnic_incoming thread. Periodically check the response
  * queue and drain it if needed.
-- 
2.20.1
