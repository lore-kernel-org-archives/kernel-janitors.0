From: Julia Lawall <julia@diku.dk>
Date: Sat, 16 Jan 2010 15:57:39 +0000
Subject: [PATCH 2/9] drivers/misc: Eliminate useless code
Message-Id: <Pine.LNX.4.64.1001161657170.28745@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable priv is initialized twice to the same (side effect-free)
expression.  Drop one initialization.

A simplified version of the semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

// <smpl>
@forall@
idexpression *x;
identifier f!=ERR_PTR;
@@

x = f(...)
... when != x
(
x = f(...,<+...x...+>,...)
|
* x = f(...)
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/misc/iwmc3200top/main.c     |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/iwmc3200top/main.c b/drivers/misc/iwmc3200top/main.c
index dd0a391..3b7292a 100644
--- a/drivers/misc/iwmc3200top/main.c
+++ b/drivers/misc/iwmc3200top/main.c
@@ -597,10 +597,8 @@ static void iwmct_remove(struct sdio_func *func)
 	struct iwmct_work_struct *read_req;
 	struct iwmct_priv *priv = sdio_get_drvdata(func);
 
-	priv = sdio_get_drvdata(func);
-
 	LOG_INFO(priv, INIT, "enter\n");
 
 	sdio_claim_host(func);
