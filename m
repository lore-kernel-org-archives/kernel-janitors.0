From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 06 Dec 2015 13:12:49 +0000
Subject: [PATCH] scripts/coccinelle: add space before &
Message-Id: <1449407569-17651-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Since Coccinelle 1.0.4, & cannot be in column 0.

Reported-by: Geyslan G. Bem <geyslan@gmail.com>
Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/iterators/use_after_iter.cocci |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/iterators/use_after_iter.cocci b/scripts/coccinelle/iterators/use_after_iter.cocci
index f085f59..ce8cc9c 100644
--- a/scripts/coccinelle/iterators/use_after_iter.cocci
+++ b/scripts/coccinelle/iterators/use_after_iter.cocci
@@ -123,7 +123,7 @@ list_remove_head(x,c,...)
 |
 sizeof(<+...c...+>)
 |
-&c->member
+ &c->member
 |
 c = E
 |

