From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:39:05 +0000
Subject: [PATCH 11/18] Coccinelle: Add api/kstrdup.cocci
Message-Id: <1282664352-15882-12-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kstrdup rather than duplicating its implementation

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/api/kstrdup.cocci |   39 ++++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/api/kstrdup.cocci

diff --git a/scripts/coccinelle/api/kstrdup.cocci b/scripts/coccinelle/api/kstrdup.cocci
new file mode 100644
index 0000000..e0805ad
--- /dev/null
+++ b/scripts/coccinelle/api/kstrdup.cocci
@@ -0,0 +1,39 @@
+/// Use kstrdup rather than duplicating its implementation
+///
+// Confidence: High
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
+expression from,to;
+expression flag,E1,E2;
+statement S;
+@@
+
+-  to = kmalloc(strlen(from) + 1,flag);
++  to = kstrdup(from, flag);
+   ... when != \(from = E1 \| to = E1 \)
+   if (to=NULL || ...) S
+   ... when != \(from = E2 \| to = E2 \)
+-  strcpy(to, from);
+
+@@
+expression x,from,to;
+expression flag,E1,E2,E3;
+statement S;
+@@
+
+-   x = strlen(from) + 1;
+    ... when != \( x = E1 \| from = E1 \)
+-   to = \(kmalloc\|kzalloc\)(x,flag);
++   to = kstrdup(from, flag);
+    ... when != \(x = E2 \| from = E2 \| to = E2 \)
+    if (to=NULL || ...) S
+    ... when != \(x = E3 \| from = E3 \| to = E3 \)
+-   memcpy(to, from, x);
-- 
1.7.0.4

