From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:39:07 +0000
Subject: [PATCH 13/18] Coccinelle: Add api/memdup_user
Message-Id: <1282664352-15882-14-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use kmemdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/api/memdup_user.cocci |   35 ++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/api/memdup_user.cocci

diff --git a/scripts/coccinelle/api/memdup_user.cocci b/scripts/coccinelle/api/memdup_user.cocci
new file mode 100644
index 0000000..72ce012
--- /dev/null
+++ b/scripts/coccinelle/api/memdup_user.cocci
@@ -0,0 +1,35 @@
+/// Use kmemdup_user rather than duplicating its implementation
+/// This is a little bit restricted to reduce false positives
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
+expression from,to,size,flag;
+position p;
+identifier l1,l2;
+@@
+
+-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
++  to = memdup_user(from,size);
+   if (
+-      to=NULL
++      IS_ERR(to)
+                 || ...) {
+   <+... when != goto l1;
+-  -ENOMEM
++  PTR_ERR(to)
+   ...+>
+   }
+-  if (copy_from_user(to, from, size) != 0) {
+-    <+... when != goto l2;
+-    -EFAULT
+-    ...+>
+-  }
-- 
1.7.0.4

