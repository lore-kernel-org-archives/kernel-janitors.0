From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:30:27 +0000
Subject: =?UTF-8?Q?[PATCH_v2_4/8]_Coccinelle:_atomic=5fas=5frefcounter:_Use_?= =?UTF-8?Q?type_=e2=80=9cexpres
Message-Id: <d9561774-a7ed-f9f8-796c-2ba2cb9f7732@users.sourceforge.net>
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
Date: Mon, 16 Jul 2018 18:00:54 +0200

The metavariable “a” is enclosed by parentheses in two rules of
a script for the semantic patch language.
Replace its type by “expression” so that the corresponding source code
search becomes more powerful.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 4da83ccfa6f6..62b0132d65fc 100644
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
 
 @r2 exists@
-identifier a, x;
+expression a;
+identifier x;
 position p1;
 @@
 
-- 
2.18.0

