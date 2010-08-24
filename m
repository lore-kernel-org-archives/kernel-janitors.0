From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:39:02 +0000
Subject: [PATCH 08/18] Coccinelle: Add iterators/itnull.cocci
Message-Id: <1282664352-15882-9-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Many iterators have the property that the first argument is always bound
to a real list element, never NULL.  False positives arise for some
iterators that do not have this property, or in cases when the loop
cursor is reassigned.  The latter should only happen when the matched
code is on the way to a loop exit (break, goto, or return).

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/iterators/itnull.cocci |   58 +++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/iterators/itnull.cocci

diff --git a/scripts/coccinelle/iterators/itnull.cocci b/scripts/coccinelle/iterators/itnull.cocci
new file mode 100644
index 0000000..baa4297
--- /dev/null
+++ b/scripts/coccinelle/iterators/itnull.cocci
@@ -0,0 +1,58 @@
+/// Many iterators have the property that the first argument is always bound
+/// to a real list element, never NULL.  False positives arise for some
+/// iterators that do not have this property, or in cases when the loop
+/// cursor is reassigned.  The latter should only happen when the matched
+/// code is on the way to a loop exit (break, goto, or return).
+///
+// Confidence: Moderate
+// Copyright: (C) 2010 Nicolas Palix, DIKU.  GPLv2.
+// Copyright: (C) 2010 Julia Lawall, DIKU.  GPLv2.
+// Copyright: (C) 2010 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual patch
+
+@@
+iterator I;
+expression x,E,E1,E2;
+statement S,S1,S2;
+@@
+
+I(x,...) { <...
+(
+- if (x = NULL && ...) S
+|
+- if (x != NULL || ...)
+  S
+|
+- (x = NULL) ||
+  E
+|
+- (x != NULL) &&
+  E
+|
+- (x = NULL && ...) ? E1 :
+  E2
+|
+- (x != NULL || ...) ?
+  E1
+- : E2
+|
+- if (x = NULL && ...) S1 else
+  S2
+|
+- if (x != NULL || ...)
+  S1
+- else S2
+|
++ BAD(
+  x = NULL
++ )
+|
++ BAD(
+  x != NULL
++ )
+)
+  ...> }
\ No newline at end of file
-- 
1.7.0.4

