From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:39:02 +0000
Subject: [PATCH v2 8/8] Coccinelle: atomic_as_refcounter: Use format string directly in the first SmPL rule
Message-Id: <0cfb32cf-2580-abee-b84c-40cf1ac78541@users.sourceforge.net>
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
Date: Mon, 16 Jul 2018 18:45:55 +0200

A format string was assigned to the Python variable “msg” before it was
used in a rule of a script for the semantic patch language.
Delete this extra variable so that the specified string object
is directly used for the desired data output.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index c9b838941024..c2b55a5babb0 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -40,8 +40,9 @@ identifier fname2 =~ "(?:call_rcu|de(?:l|stroy)|(?:queue|schedule)_work)";
 p1 << r1.p1;
 p2 << r1.p2;
 @@
-msg = "atomic_dec_and_test variation before object free at line %s."
-coccilib.report.print_report(p1[0], msg % (p2[0].line))
+coccilib.report.print_report(p1[0],
+                             "atomic_dec_and_test variation before object free at line %s."
+                             % (p2[0].line))
 
 @r2 exists@
 expression a;
-- 
2.18.0

