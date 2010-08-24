From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 24 Aug 2010 15:39:00 +0000
Subject: [PATCH 06/18] Coccinelle: Add locks/mini_lock.cocci
Message-Id: <1282664352-15882-7-git-send-email-npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282664352-15882-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1282664352-15882-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix@diku.dk>, Michal Marek <mmarek@suse.cz>
Cc: cocci@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Find missing unlocks.  This semantic match considers the specific case
where the unlock is missing from an if branch, and there is a lock
before the if and an unlock after the if.  False positives are due to
cases where the if branch represents a case where the function is
supposed to exit with the lock held, or where there is some preceding
function call that releases the lock.

Signed-off-by: Nicolas Palix <npalix@diku.dk>
Signed-off-by: Julia Lawall <julia@diku.dk>
---
 scripts/coccinelle/locks/mini_lock.cocci |   95 ++++++++++++++++++++++++++++++
 1 files changed, 95 insertions(+), 0 deletions(-)
 create mode 100644 scripts/coccinelle/locks/mini_lock.cocci

diff --git a/scripts/coccinelle/locks/mini_lock.cocci b/scripts/coccinelle/locks/mini_lock.cocci
new file mode 100644
index 0000000..7641a29
--- /dev/null
+++ b/scripts/coccinelle/locks/mini_lock.cocci
@@ -0,0 +1,95 @@
+/// Find missing unlocks.  This semantic match considers the specific case
+/// where the unlock is missing from an if branch, and there is a lock
+/// before the if and an unlock after the if.  False positives are due to
+/// cases where the if branch represents a case where the function is
+/// supposed to exit with the lock held, or where there is some preceding
+/// function call that releases the lock.
+///
+// Confidence: Moderate
+// Copyright: (C) 2010 Nicolas Palix, DIKU.  GPLv2.
+// Copyright: (C) 2010 Julia Lawall, DIKU.  GPLv2.
+// Copyright: (C) 2010 Gilles Muller, INRIA/LiP6.  GPLv2.
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual org
+virtual report
+
+@prelocked@
+position p1,p;
+expression E1;
+@@
+
+(
+mutex_lock@p1
+|
+mutex_trylock@p1
+|
+spin_lock@p1
+|
+spin_trylock@p1
+|
+read_lock@p1
+|
+read_trylock@p1
+|
+write_lock@p1
+|
+write_trylock@p1
+|
+read_lock_irq@p1
+|
+write_lock_irq@p1
+|
+read_lock_irqsave@p1
+|
+write_lock_irqsave@p1
+|
+spin_lock_irq@p1
+|
+spin_lock_irqsave@p1
+) (E1@p,...);
+
+@looped@
+position r;
+@@
+
+for(...;...;...) { <+... return@r ...; ...+> }
+
+@err@
+expression E1;
+position prelocked.p;
+position up != prelocked.p1;
+position r!=looped.r;
+identifier lock,unlock;
+@@
+
+lock(E1@p,...);
+<+... when != E1
+if (...) {
+  ... when != E1
+  return@r ...;
+}
+...+>
+unlock@up(E1,...);
+
+@script:python depends on org@
+p << prelocked.p1;
+lock << err.lock;
+unlock << err.unlock;
+p2 << err.r;
+@@
+
+cocci.print_main(lock,p)
+cocci.print_secs(unlock,p2)
+
+@script:python depends on report@
+p << prelocked.p1;
+lock << err.lock;
+unlock << err.unlock;
+p2 << err.r;
+@@
+
+msg = "preceding lock on line %s" % (p[0].line)
+coccilib.report.print_report(p2[0],msg)
-- 
1.7.0.4

