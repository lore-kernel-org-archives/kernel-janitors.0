From: Julia Lawall <julia@diku.dk>
Date: Tue, 28 Jul 2009 15:52:56 +0000
Subject: [PATCH 2/9] drivers/staging: correct error-handling code
Message-Id: <Pine.LNX.4.64.0907281752370.28189@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dst_state_alloc returns an ERR_PTR value in an error case instead of NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@match exists@
expression x, E;
statement S1, S2;
@@

x = dst_state_alloc(...)
... when != x = E
(
*  if (x = NULL || ...) S1 else S2
|
*  if (x = NULL && ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/dst/export.c        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/dst/export.c b/drivers/staging/dst/export.c
index 80ae4eb..4fbd848 100644
--- a/drivers/staging/dst/export.c
+++ b/drivers/staging/dst/export.c
@@ -159,7 +159,7 @@ static struct dst_state *dst_accept_client(struct dst_state *st)
 		goto err_out_exit;
 
 	new = dst_state_alloc(st->node);
-	if (!new) {
+	if (IS_ERR(new)) {
 		err = -ENOMEM;
 		goto err_out_release;
 	}
