From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:16:52 +0000
Subject: [PATCH 3/7] drivers/net/cxgb3: Use kzalloc for allocating only one
Message-Id: <Pine.LNX.4.64.0912190816340.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Divy Le Ray <divy@chelsio.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than kcalloc(1,...)

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/cxgb3/cxgb3_offload.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/net/cxgb3/cxgb3_offload.c b/drivers/net/cxgb3/cxgb3_offload.c
--- a/drivers/net/cxgb3/cxgb3_offload.c 2009-09-14 14:55:49.000000000 +0200
+++ b/drivers/net/cxgb3/cxgb3_offload.c 2009-12-19 07:52:52.000000000 +0100
@@ -1252,7 +1252,7 @@ int cxgb3_offload_activate(struct adapte
 	struct mtutab mtutab;
 	unsigned int l2t_capacity;
 
-	t = kcalloc(1, sizeof(*t), GFP_KERNEL);
+	t = kzalloc(sizeof(*t), GFP_KERNEL);
 	if (!t)
 		return -ENOMEM;
 
