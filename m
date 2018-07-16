From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 16 Jul 2018 17:26:51 +0000
Subject: [PATCH v2 2/8] Coccinelle: atomic_as_refcounter: Omit placeholder specifications from a SmPL constra
Message-Id: <7f7e6a42-3ff1-2495-57df-fb3b09cc1a21@users.sourceforge.net>
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
Date: Mon, 16 Jul 2018 17:34:56 +0200

A string was enclosed by placeholder specifications for
regular expressions as constraints for metavariables in a script
for the semantic patch language.
The desired search functionality can be achieved also without
the notation “.*”. Thus delete it at a specific place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 scripts/coccinelle/api/atomic_as_refcounter.cocci | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coccinelle/api/atomic_as_refcounter.cocci b/scripts/coccinelle/api/atomic_as_refcounter.cocci
index 61fcaf5e45a3..46d27b2b1dff 100644
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
-- 
2.18.0

