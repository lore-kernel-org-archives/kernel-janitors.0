From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 30 Jan 2016 15:27:04 +0000
Subject: [PATCH] Coccinelle: reduce rule applicability
Message-Id: <1454167624-22409-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Rule r is only use in org or report mode, so only execute it in those
cases.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/badty.cocci |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/misc/badty.cocci b/scripts/coccinelle/misc/badty.cocci
index 2fc06fc..481cf30 100644
--- a/scripts/coccinelle/misc/badty.cocci
+++ b/scripts/coccinelle/misc/badty.cocci
@@ -50,7 +50,7 @@ T **x;
 //  For org and report mode
 //----------------------------------------------------------
 
-@r disable sizeof_type_expr@
+@r depends on (org || report) disable sizeof_type_expr@
 type T;
 T **x;
 position p;

