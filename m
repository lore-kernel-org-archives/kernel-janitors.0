From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Dec 2018 06:14:16 +0000
Subject: [PATCH] scripts: coccinelle: boolinit: drop warnings on named constants
Message-Id: <1546064056-15569-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, cocci@systeme.lip6.fr

Coccinelle doesn't always have access to the values of named
(#define) constants, and they may likely often be bound to true
and false values anyway, resulting in false positives.  So stop
warning about them.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/boolinit.cocci |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/coccinelle/misc/boolinit.cocci b/scripts/coccinelle/misc/boolinit.cocci
index b0584a3..aabb581 100644
--- a/scripts/coccinelle/misc/boolinit.cocci
+++ b/scripts/coccinelle/misc/boolinit.cocci
@@ -136,9 +136,14 @@ position p1;
 @r4 depends on !patch@
 bool b;
 position p2;
+identifier i;
 constant c != {0,1};
 @@
+(
+ b = i
+|
 *b@p2 = c
+)
 
 @script:python depends on org@
 p << r1.p;
