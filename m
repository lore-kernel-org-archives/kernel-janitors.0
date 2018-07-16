From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:36:33 +0000
Subject: [PATCH v2 7/8] Coccinelle: atomic_as_refcounter: Use string literals directly in two SmPL rules
Message-Id: <a50c134e-fb8a-afb8-c3d5-57ff16cba89a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
 <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
In-Reply-To: <5ca6ab58-e929-8468-74e2-012f987a0773@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 18:36:41 +0200

String literals were always assigned to the Python variable “msg”
before they were used in two rules of a script for the semantic
patch language.
Delete these extra variables so that the specified string objects
are directly used for the desired data output.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 7eae23dc9ea8..c9b838941024 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -53,8 +53,7 @@ position p1;
 @script:python depends on report@
 p1 << r2.p1;
 @@
-msg = "atomic_add_unless"
-coccilib.report.print_report(p1[0], msg)
+coccilib.report.print_report(p1[0], "atomic_add_unless")
 
 @r3 exists@
 expression E;
@@ -66,5 +65,4 @@ position p1;
 @script:python depends on report@
 p1 << r3.p1;
 @@
-msg = "x = atomic_add_return(-1, ...)"
-coccilib.report.print_report(p1[0], msg)
+coccilib.report.print_report(p1[0], "x = atomic_add_return(-1, ...)")
-- 
2.18.0

