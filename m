From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:38:55 +0000
Subject: [PATCH 01/18] Coccinelle: Add null/eno.cocci
Message-Id: <1282664352-15882-2-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The various basic memory allocation functions don't return ERR_PTR

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/null/eno.cocci |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/null/eno.cocci

diff --git a/scripts/coccinelle/null/eno.cocci b/scripts/coccinelle/null/eno.cocci
new file mode 100644
index 0000000..4c9c52b
--- /dev/null
+++ b/scripts/coccinelle/null/eno.cocci
@@ -0,0 +1,20 @@
+/// The various basic memory allocation functions don't return ERR_PTR
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
+expression x,E;
+@@
+
+x = \(kmalloc\|kzalloc\|kcalloc\|kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\|kmalloc_node\|kzalloc_node\)(...)
+... when != x = E
+- IS_ERR(x)
++ !x
-- 
1.7.0.4

