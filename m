From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 22 Sep 2016 08:28:55 +0000
Subject: [PATCH] Coccinelle: pm_runtime: ensure relevance of pm_runtime reports
Message-Id: <1474532935-22506-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

pm_runtime.cocci starts with one rule that searches for a variety of
functions calls, followed by various rules that report errors.  Previously,
the only connection between the first rule and the rest was to check that
the first rule had matched somewhere.  Change the rules to propagate a
position from the first rule to the others, to make sure that the sites
reported on are the same as the sites that were identified as having the
relevant functions.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/pm_runtime.cocci |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/coccinelle/api/pm_runtime.cocci b/scripts/coccinelle/api/pm_runtime.cocci
index 89b98a2..d67ccf5 100644
--- a/scripts/coccinelle/api/pm_runtime.cocci
+++ b/scripts/coccinelle/api/pm_runtime.cocci
@@ -17,9 +17,10 @@ virtual report
 
 @runtime_bad_err_handle exists@
 expression ret;
+position p;
 @@
 (
-ret = \(pm_runtime_idle\|
+ret@p = \(pm_runtime_idle\|
 	pm_runtime_suspend\|
 	pm_runtime_autosuspend\|
 	pm_runtime_resume\|
@@ -47,12 +48,13 @@ IS_ERR_VALUE(ret)
 //  For context mode
 //----------------------------------------------------------
 
-@depends on runtime_bad_err_handle && context@
+@depends on context@
 identifier pm_runtime_api;
 expression ret;
+position runtime_bad_err_handle.p;
 @@
 (
-ret = pm_runtime_api(...);
+ret@p = pm_runtime_api(...);
 ...
 * IS_ERR_VALUE(ret)
 ...
@@ -62,12 +64,13 @@ ret = pm_runtime_api(...);
 //  For patch mode
 //----------------------------------------------------------
 
-@depends on runtime_bad_err_handle && patch@
+@depends on patch@
 identifier pm_runtime_api;
 expression ret;
+position runtime_bad_err_handle.p;
 @@
 (
-ret = pm_runtime_api(...);
+ret@p = pm_runtime_api(...);
 ...
 - IS_ERR_VALUE(ret)
 + ret < 0
@@ -78,13 +81,14 @@ ret = pm_runtime_api(...);
 //  For org and report mode
 //----------------------------------------------------------
 
-@r depends on runtime_bad_err_handle && (org || report) exists@
+@r depends on (org || report) exists@
 position p1, p2;
 identifier pm_runtime_api;
 expression ret;
+position runtime_bad_err_handle.p;
 @@
 (
-ret = pm_runtime_api@p1(...);
+ret@p = pm_runtime_api@p1(...);
 ...
 IS_ERR_VALUE@p2(ret)
 ...

