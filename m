From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Nov 2019 15:56:57 +0000
Subject: [PATCH] Coccinelle: ptr_ret: drop PTR_ERR_OR_ZERO semantic patch
Message-Id: <1574179017-23787-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Gilles Muller <Gilles.Muller@inria.fr>, cocci@systeme.lip6.fr

This mostly made changes that made the code harder
to read, so drop it.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 scripts/coccinelle/api/ptr_ret.cocci |   97 -----------------------------------
 1 file changed, 97 deletions(-)

diff --git a/scripts/coccinelle/api/ptr_ret.cocci b/scripts/coccinelle/api/ptr_ret.cocci
deleted file mode 100644
index e76cd5d..0000000
--- a/scripts/coccinelle/api/ptr_ret.cocci
+++ /dev/null
@@ -1,97 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-///
-/// Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
-///
-// Confidence: High
-// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.
-// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.
-// URL: http://coccinelle.lip6.fr/
-// Options: --no-includes --include-headers
-//
-// Keywords: ERR_PTR, PTR_ERR, PTR_ERR_OR_ZERO
-// Version min: 2.6.39
-//
-
-virtual context
-virtual patch
-virtual org
-virtual report
-
-@depends on patch@
-expression ptr;
-@@
-
-- if (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
-+ return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
-- if (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
-+ return PTR_ERR_OR_ZERO(ptr);
-
-@depends on patch@
-expression ptr;
-@@
-
-- (IS_ERR(ptr) ? PTR_ERR(ptr) : 0)
-+ PTR_ERR_OR_ZERO(ptr)
-
-@r1 depends on !patch@
-expression ptr;
-position p1;
-@@
-
-* if@p1 (IS_ERR(ptr)) return PTR_ERR(ptr); else return 0;
-
-@r2 depends on !patch@
-expression ptr;
-position p2;
-@@
-
-* if@p2 (IS_ERR(ptr)) return PTR_ERR(ptr); return 0;
-
-@r3 depends on !patch@
-expression ptr;
-position p3;
-@@
-
-* IS_ERR@p3(ptr) ? PTR_ERR(ptr) : 0
-
-@script:python depends on org@
-p << r1.p1;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-
-@script:python depends on org@
-p << r2.p2;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on org@
-p << r3.p3;
-@@
-
-coccilib.org.print_todo(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r1.p1;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r2.p2;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
-
-@script:python depends on report@
-p << r3.p3;
-@@
-
-coccilib.report.print_report(p[0], "WARNING: PTR_ERR_OR_ZERO can be used")
