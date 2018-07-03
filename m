From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:40:30 +0000
Subject: =?UTF-8?Q?[PATCH_3/6]_Coccinelle:_atomic=5fas=5frefcounter:_Use_typ?= =?UTF-8?Q?e_=e2=80=9cexpressio
Message-Id: <c87de98e-9566-0bac-8264-8bc2a6e06d51@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAT=7E0HFd+MM92VcNdA1i6AME6qyFA9sN-2dabibxkiJg@mail.gmail.com>
 <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
In-Reply-To: <6043bdc9-529f-e93f-e509-e2dedd290a10@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Elena Reshetova <elena.reshetova@intel.com>, Julia Lawall <julia.lawall@lip6.fr>, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Jul 2018 17:55:27 +0200

The metavariable “a” is enclosed by parentheses in three rules of
a script for the semantic patch language.
Replace its type by “expression” so that the corresponding source code
search becomes more powerful.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 5571eea04c7b..57af2db9463e 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -10,7 +10,8 @@
 virtual report
 
 @r1 exists@
-identifier a, x;
+expression a;
+identifier x;
 position p1, p2;
 identifier fname =~ "free";
 identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
@@ -45,7 +46,8 @@ msg = "atomic_dec_and_test variation before object free at line %s."
 coccilib.report.print_report(p1[0], msg % (p2[0].line))
 
 @r4 exists@
-identifier a, x, y;
+expression a;
+identifier x, y;
 position p1, p2;
 identifier fname =~ "free";
 @@
@@ -77,7 +79,8 @@ msg = "atomic_dec_and_test variation before object free at line %s."
 coccilib.report.print_report(p1[0], msg % (p2[0].line))
 
 @r2 exists@
-identifier a, x;
+expression a;
+identifier x;
 position p1;
 @@
 
-- 
2.18.0

