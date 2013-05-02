From: strnape1@fel.cvut.cz
Date: Thu, 02 May 2013 00:28:52 +0000
Subject: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <20130502022852.Horde.yR656A8XjjNGicOYeGAGWg1@wimap.feld.cvut.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Created coccinelle script for reporting missing pci_free_consistent() calls.

Signed-off-by: Petr Strnad <strnape1@fel.cvut.cz>
---
diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci  
b/scripts/coccinelle/free/pci_free_consistent.cocci
new file mode 100644
index 0000000..9d9a56f
--- /dev/null
+++ b/scripts/coccinelle/free/pci_free_consistent.cocci
@@ -0,0 +1,44 @@
+/// Find missing pci_free_consistent for every pci_alloc_consistent.
+///
+// Confidence: Moderate
+// Copyright: (C) 2013 Petr Strnad.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Keywords: pci_free_consistent, pci_alloc_consistent
+// Options: --no-includes --include-headers
+
+virtual report
+
+@search@
+local idexpression id;
+expression x,y,z;
+position p1,p2;
+@@
+
+id = pci_alloc_consistent@p1(x,y,&z)
+... when != pci_free_consistent(x,y,id,z)
+    when forall
+(
+if (id = NULL) { ... return ...; }
+|
+if (id = NULL || (unsigned long)id & 0xFF) { ... return ...; }
+|
+if (id = NULL) return ...;
+|
+if (id) { ... return 0; }
+|
+if (id) { ... } else { ... } return 0;
+|
+return 0;
+|
+return id;
+|
+*return@p2 ...;
+)
+
+@script:python depends on report@
+p1 << search.p1;
+p2 << search.p2;
+@@
+
+msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on  
line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
+coccilib.report.print_report(p2[0],msg)

