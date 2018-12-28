From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 28 Dec 2018 14:49:01 +0000
Subject: [PATCH] scripts/coccinelle: check for redeclaration
Message-Id: <1546008541-3175-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, "Jason A . Donenfeld" <zx2c4@kernel.org>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr

Avoid reporting on the use of an iterator index variable when
the variable is redeclared.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/iterators/use_after_iter.cocci |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coccinelle/iterators/use_after_iter.cocci b/scripts/coccinelle/iterators/use_after_iter.cocci
index ce8cc9c..66a1140 100644
--- a/scripts/coccinelle/iterators/use_after_iter.cocci
+++ b/scripts/coccinelle/iterators/use_after_iter.cocci
@@ -35,6 +35,7 @@ iterator name hlist_for_each_entry_from;
 iterator name hlist_for_each_entry_safe;
 statement S;
 position p1,p2;
+type T;
 @@
 
 (
@@ -125,6 +126,8 @@ sizeof(<+...c...+>)
 |
  &c->member
 |
+T c;
+|
 c = E
 |
 *c@p2
