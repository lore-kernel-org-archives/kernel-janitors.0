From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 03 Jul 2018 07:35:26 +0000
Subject: [PATCH 1/6] Coccinelle: atomic_as_refcounter: Omit placeholder specifications from two SmPL constrai
Message-Id: <420481d3-0ec7-3990-30b3-0ef2118e5be8@users.sourceforge.net>
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
Date: Mon, 2 Jul 2018 16:33:46 +0200

A string was enclosed by placeholder specifications for
regular expressions as constraints for metavariables in a script
for the semantic patch language.
The desired search functionality can be achieved also without
the notation “.*”. Thus delete it.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 988120e0fd67..94373a35744e 100644
--- a/scripts/coccinelle/api/atomic_as_refcounter.cocci
+++ b/scripts/coccinelle/api/atomic_as_refcounter.cocci
@@ -12,7 +12,7 @@ virtual report
 @r1 exists@
 identifier a, x;
 position p1, p2;
-identifier fname =~ ".*free.*";
+identifier fname =~ "free";
 identifier fname2 =~ ".*destroy.*";
 identifier fname3 =~ ".*del.*";
 identifier fname4 =~ ".*queue_work.*";
@@ -60,8 +60,7 @@ coccilib.report.print_report(p1[0], msg % (p2[0].line))
 @r4 exists@
 identifier a, x, y;
 position p1, p2;
-identifier fname =~ ".*free.*";
-
+identifier fname =~ "free";
 @@
 
 (
-- 
2.18.0

