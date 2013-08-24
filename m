From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 24 Aug 2013 17:13:14 +0000
Subject: [PATCH 0/2] simplify devm_request_mem_region/devm_ioremap
Message-Id: <1377364396-27861-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com

Convert the composition of devm_request_mem_region and devm_ioremap to a
single call to devm_ioremap_resource.  The associated call to
platform_get_resource is also simplified and moved next to the new call to
devm_ioremap_resource.

The semantic patch used to perform this transformation is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression dev,res,size,name,base;
identifier l;
@@

-if (!devm_request_mem_region(dev, res->start, size, name))
- { ... \(goto l;\|return ...;\) }
... when != res->start
base (
-devm_ioremap(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
|
-devm_ioremap_nocache(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
)
... when any
    when != res->start

@@
expression pdev,res,n,r.base,e1,e2;
identifier l,f,res1;
type T;
@@

(
(
  T res1 = f(pdev, IORESOURCE_MEM, n);
|
  res1 = f(pdev, IORESOURCE_MEM, n);
)
- if (res1 = NULL) { ... \(goto l;\|return ...;\) }
  base = devm_request_and_ioremap(e1, res1);
|
(
- res = f(pdev, IORESOURCE_MEM, n);
|
  T res1
-  = f(pdev, IORESOURCE_MEM, n)
  ;
)
  ... when != res
(
- if (res = NULL) { ... \(goto l;\|return ...;\) }
|
 if (
-     res = NULL ||
      e2
    ) { ... \(goto l;\|return ...;\) }
)
  ... when != res
+ res = f(pdev, IORESOURCE_MEM, n);
  base = devm_request_and_ioremap(e1, res);
)

@@
expression r.base, dev, res;
@@

base = 
- devm_request_and_ioremap
+ devm_ioremap_resource
 (dev, res);
 ...
 if (
-base = NULL
+IS_ERR(base)
 || ...) {
<...
-	return ...;
+	return PTR_ERR(base);
...>
 }

@@
expression r.base, dev, res;
@@

base = 
- devm_request_and_ioremap
+ devm_ioremap_resource
 (dev, res);

@@
expression r.base, E, ret;
identifier l;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...) {
 	... when any
-	ret = E;
+	ret = PTR_ERR(base);
 	...
(
 	return ret;
|
 	goto l;
)
 }

@@
expression r.base;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...) {
 	<...
-	\(dev_dbg\|dev_warn\|dev_err\|pr_debug\|pr_err\|DRM_ERROR\)(...);
 	...>
 }

@@
expression r.base;
identifier l;
@@

 base = devm_ioremap_resource(...);
 ...
 if (IS_ERR(base) || ...)
-{
(
 	return ...;
|
 	goto l;
)
-}
// </smpl>


