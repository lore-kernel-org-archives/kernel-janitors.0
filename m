From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 21 Apr 2012 18:14:58 +0000
Subject: [PATCH] scripts/coccinelle: address test is always true
Message-Id: <1335032098-4966-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335032098-4966-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1335032098-4966-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@diku.dk, mmarek@suse.cz, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/misc/ifaddr.cocci |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc/ifaddr.cocci
new file mode 100644
index 0000000..3e4089a
--- /dev/null
+++ b/scripts/coccinelle/misc/ifaddr.cocci
@@ -0,0 +1,35 @@
+/// the address of a variable or field is non-zero is likely always to bo
+/// non-zero
+///
+// Confidence: High
+// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
+// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual org
+virtual report
+virtual context
+
+@r@
+expression x;
+statement S1,S2;
+position p;
+@@
+
+*if@p (&x)
+ S1 else S2
+
+@script:python depends on org@
+p << r.p;
+@@
+
+cocci.print_main("test of a variable/field address",p)
+
+@script:python depends on report@
+p << r.p;
+@@
+
+msg = "ERROR: test of a variable/field address"
+coccilib.report.print_report(p[0],msg)

