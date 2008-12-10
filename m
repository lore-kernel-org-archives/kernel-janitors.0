From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Dec 2008 16:37:59 +0000
Subject: [PATCH 16/28] arch/blackfin: Drop return value from platform_driver
Message-Id: <Pine.LNX.4.64.0812101737360.21998@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitri.vorobiev@movial.fi, cooloney@kernel.org, uclinux-dist-devel@blackfin.uclinux.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The return value of the remove function of a driver structure, and thus of
a platform_driver structure, is ultimately ignored, and is thus
unnecessary.  This patch removes the return value for the remove function
stored in a platform_driver structure.  For the file in this patch, the
original return value might have been something other than 0.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
struct platform_driver I;
identifier a,f;
position p;
@@
I.remove = \(f@p\|a(f@p)\);

@void_called@
identifier r.f;
position p;
@@
f@p(...);

@called@
identifier r.f;
position p1 != void_called.p;
@@
f@p1(...)

@localfn@
identifier r.f;
@@
static int f(...) { ... }

@depends on !called && localfn@
struct platform_driver I;
identifier a,f;
position r.p;
@@

I.
- remove
+ remove_new
   = \(f@p\|a(f@p)\);

@depends on !called && localfn@
identifier r.f,i;
constant C;
expression E;
@@

- int
+ void
       f(...) {
  <...
(
-  return \(C\|i\);
+  return;
|
-  return E;
+  E;
+  return;
)
  ...>
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/blackfin/mach-common/dpmc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/blackfin/mach-common/dpmc.c b/arch/blackfin/mach-common/dpmc.c
index 02c7efd..72e408d 100644
--- a/arch/blackfin/mach-common/dpmc.c
+++ b/arch/blackfin/mach-common/dpmc.c
@@ -99,16 +99,16 @@ static int __devinit bfin_dpmc_probe(struct platform_device *pdev)
 /**
  *	bfin_dpmc_remove -
  */
-static int __devexit bfin_dpmc_remove(struct platform_device *pdev)
+static void __devexit bfin_dpmc_remove(struct platform_device *pdev)
 {
 	pdata = NULL;
-	return cpufreq_unregister_notifier(&vreg_cpufreq_notifier_block,
-					 CPUFREQ_TRANSITION_NOTIFIER);
+	cpufreq_unregister_notifier(&vreg_cpufreq_notifier_block,
+					CPUFREQ_TRANSITION_NOTIFIER);
 }
 
 struct platform_driver bfin_dpmc_device_driver = {
 	.probe   = bfin_dpmc_probe,
-	.remove  = __devexit_p(bfin_dpmc_remove),
+	.remove_new = __devexit_p(bfin_dpmc_remove),
 	.driver  = {
 		.name = DRIVER_NAME,
 	}
