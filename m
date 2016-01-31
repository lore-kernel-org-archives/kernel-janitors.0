From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 31 Jan 2016 16:26:57 +0000
Subject: [PATCH] Coccinelle: pm_runtime: reduce rule applicability
Message-Id: <1454257617-3115-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Rule r is only used in org or report mode, so only execute it in those
cases.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/pm_runtime.cocci |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/api/pm_runtime.cocci b/scripts/coccinelle/api/pm_runtime.cocci
index b7042d0..89b98a2 100644
--- a/scripts/coccinelle/api/pm_runtime.cocci
+++ b/scripts/coccinelle/api/pm_runtime.cocci
@@ -78,7 +78,7 @@ ret = pm_runtime_api(...);
 //  For org and report mode
 //----------------------------------------------------------
 
-@r depends on runtime_bad_err_handle exists@
+@r depends on runtime_bad_err_handle && (org || report) exists@
 position p1, p2;
 identifier pm_runtime_api;
 expression ret;

