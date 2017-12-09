From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Dec 2017 11:50:04 +0000
Subject: [PATCH 2/2] um: vector_kern: Fix NULL deref in destroy_queue()
Message-Id: <20171209115004.tsxt7qnlhagp4xyn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We dereference "qi" before checking whether it is NULL.  There is one
error path in create_queue() which passes a NULL to destroy_queue() so
this could result in a NULL pointer dereference.

Fixes: ad1f62ab2bd4 ("High Performance UML Vector Network Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index bb83a2d22ac2..5219c37b8d03 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -455,11 +455,12 @@ static void destroy_queue(struct vector_queue *qi)
 {
 	int i;
 	struct iovec *iov;
-	struct vector_private *vp = netdev_priv(qi->dev);
+	struct vector_private *vp;
 	struct mmsghdr *mmsg_vector;
 
 	if (qi = NULL)
 		return;
+	vp = netdev_priv(qi->dev);
 	/* deallocate any skbuffs - we rely on any unused to be
 	 * set to NULL.
 	 */
