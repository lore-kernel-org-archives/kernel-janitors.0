From: Himanshu Jha <himanshujha199640@gmail.com>
Date: Sat, 06 Apr 2019 06:23:12 +0000
Subject: [PATCH] coccinelle: api: add devm_platform_ioremap_resource script
Message-Id: <20190406061112.31620-1-himanshujha199640@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yamada.masahiro@socionext.com, Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, michal.lkml@markovi.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.palix@imag.fr, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com, cocci@systeme.lip6.fr

Use recently introduced devm_platform_ioremap_resource
helper which wraps platform_get_resource() and
devm_ioremap_resource() together. This helps produce much
cleaner code while removing local `struct resource` declaration.

Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
---

Tree wide changes has been tested through 0-day test service
with build success.

BUILD SUCCESS 74ebaaca5d14d3d9b03e911f0b4995b78a4d60f0
tree/branch: https://github.com/himanshujha199640/linux-next  20190401-devm_platform_ioremap_resource-final
branch HEAD: 74ebaaca5d14d3d9b03e911f0b4995b78a4d60f0  Coccinelle: api: Add devm_platform_ioremap_resource.cocci

elapsed time: 385m
configs tested: 162


Stats:
916 files changed, 1028 insertions(+), 2921 deletions(-)

Note: cases where the `struct resource *res` variable is
used subsequently in the function have been ignored out because
those cases produce:

eg., drivers/bus/da8xx-mstpri.c

warning: 'res' may be used uninitialized in this function [-Wmaybe-uninitialized]

due to: 
	if (prio_descr->reg + sizeof(u32) > resource_size(res)) {

which seems correct as `res` isn't initialized in the scope of
the function(da8xx_mstpri_probe) and instead initialized inside:

   void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
                                                unsigned int index)
   {
           struct resource *res;
   
           res = platform_get_resource(pdev, IORESOURCE_MEM, index);
           return devm_ioremap_resource(&pdev->dev, res);
   }
   EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);


 .../api/devm_platform_ioremap_resource.cocci  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci

diff --git a/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci b/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
new file mode 100644
index 000000000000..a28274af14df
--- /dev/null
+++ b/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
@@ -0,0 +1,63 @@
+/// Use devm_platform_ioremap_resource helper which wraps
+/// platform_get_resource() and devm_ioremap_resource() together.
+///
+// Confidence: High
+// Copyright: (C) 2019 Himanshu Jha GPLv2.
+// Copyright: (C) 2019 Julia Lawall, Inria/LIP6. GPLv2.
+// Keywords: platform_get_resource, devm_ioremap_resource,
+// Keywords: devm_platform_ioremap_resource
+
+virtual patch
+virtual report
+
+@r depends on patch && !report@
+expression e1, e2, arg1, arg2, arg3, arg4;
+identifier id;
+@@
+
+(
+- id = platform_get_resource(arg1, arg2, arg3);
+|
+- struct resource *id = platform_get_resource(arg1, arg2, arg3);
+)
+  ... when != id
+- e1 = devm_ioremap_resource(arg4, id);
++ e1 = devm_platform_ioremap_resource(arg1, arg3);
+  ... when != id
+? id = e2
+
+@r1 depends on patch && !report@
+identifier r.id;
+type T;
+@@
+
+- T *id;
+  ...when != id
+
+// ----------------------------------------------------------------------------
+
+@r2 depends on report && !patch@
+identifier id;
+expression e1, e2, arg1, arg2, arg3, arg4;
+position j0;
+@@
+
+(
+  id = platform_get_resource(arg1, arg2, arg3);
+|
+  struct resource *id = platform_get_resource(arg1, arg2, arg3);
+)
+  ... when != id
+  e1@j0 = devm_ioremap_resource(arg4, id);
+  ... when != id
+? id = e2
+
+// ----------------------------------------------------------------------------
+
+@script:python depends on report && !patch@
+e1 << r2.e1;
+j0 << r2.j0;
+@@
+
+msg = "WARNING: Use devm_platform_ioremap_resource for %s" % (e1)
+coccilib.report.print_report(j0[0], msg)
-- 
2.17.1
