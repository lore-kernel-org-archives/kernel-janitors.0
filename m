From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 03 Feb 2016 18:05:46 +0000
Subject: [PATCH] coccinelle: bugon: reduce rule applicability
Message-Id: <1454522746-396-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Rule r is only use in org or report mode, so only execute it in those
cases.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/bugon.cocci |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/misc/bugon.cocci b/scripts/coccinelle/misc/bugon.cocci
index 27c97f1..7415860 100644
--- a/scripts/coccinelle/misc/bugon.cocci
+++ b/scripts/coccinelle/misc/bugon.cocci
@@ -40,7 +40,7 @@ expression e;
 //  For org and report mode
 //----------------------------------------------------------
 
-@r@
+@r depends on (org || report)@
 expression e;
 position p;
 @@

