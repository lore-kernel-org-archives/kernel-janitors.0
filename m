From: Julia Lawall <julia@diku.dk>
Date: Tue, 02 Aug 2011 10:34:54 +0000
Subject: [PATCH 1/11] kernel/kfifo.c: trivial: use BUG_ON
Message-Id: <1312281304-11847-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, Stefani Seibold <stefani@seibold.net>, Andrea Righi <arighi@develer.com>, "Ira W. Snyder" <iws@ovro.caltech.edu>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use BUG_ON(x) rather than if(x) BUG();

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ identifier x; @@
-if (x) BUG();
+BUG_ON(x);

@@ identifier x; @@
-if (!x) BUG();
+BUG_ON(!x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 kernel/kfifo.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff -u -p a/kernel/kfifo.c b/kernel/kfifo.c
--- a/kernel/kfifo.c
+++ b/kernel/kfifo.c
@@ -562,8 +562,7 @@ EXPORT_SYMBOL(__kfifo_to_user_r);
 unsigned int __kfifo_dma_in_prepare_r(struct __kfifo *fifo,
 	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
 {
-	if (!nents)
-		BUG();
+	BUG_ON(!nents);
 
 	len = __kfifo_max_r(len, recsize);
 
@@ -586,8 +585,7 @@ EXPORT_SYMBOL(__kfifo_dma_in_finish_r);
 unsigned int __kfifo_dma_out_prepare_r(struct __kfifo *fifo,
 	struct scatterlist *sgl, int nents, unsigned int len, size_t recsize)
 {
-	if (!nents)
-		BUG();
+	BUG_ON(!nents);
 
 	len = __kfifo_max_r(len, recsize);
 

