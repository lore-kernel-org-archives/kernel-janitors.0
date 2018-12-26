From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 26 Dec 2018 07:54:49 +0000
Subject: [PATCH 2/2] um: vector: Use 'kmalloc_array' instead of 'kmalloc'
Message-Id: <20181226075449.11071-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, rppt@linux.vnet.ibm.com, akpm@linux-foundation.org, yuehaibing@huawei.com, keescook@chromium.org
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'kmalloc_array' instead of 'kmalloc' when appropriate.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I don't know why it has not already been replaced in 6da2ec56059c
("treewide: kmalloc() -> kmalloc_array()".
---
 arch/um/drivers/vector_kern.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 5b917716289d..dee5246bda81 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -507,12 +507,12 @@ static struct vector_queue *create_queue(
 		return NULL;
 	result->max_depth = max_size;
 	result->dev = vp->dev;
-	result->mmsg_vector = kmalloc(
-		(sizeof(struct mmsghdr) * max_size), GFP_KERNEL);
+	result->mmsg_vector = kmalloc_array(max_size, sizeof(struct mmsghdr),
+					    GFP_KERNEL);
 	if (result->mmsg_vector = NULL)
 		goto out_mmsg_fail;
-	result->skbuff_vector = kmalloc(
-		(sizeof(void *) * max_size), GFP_KERNEL);
+	result->skbuff_vector = kmalloc_array(max_size, sizeof(void *),
+					      GFP_KERNEL);
 	if (result->skbuff_vector = NULL)
 		goto out_skb_fail;
 
-- 
2.19.1
