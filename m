From: Julia Lawall <julia@diku.dk>
Date: Mon, 09 Jun 2008 12:21:18 +0000
Subject: [PATCH 3/4] drivers/video/fsl-diu-fb.c: add missing of_node_put
Message-Id: <Pine.LNX.4.64.0806091420450.16009@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adaplas@gmail.com, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

of_node_put is needed before discarding a value received from
of_find_node_by_type, eg in error handling code.

The semantic patch that makes the change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
struct device_node *n;
struct device_node *n1;
struct device_node *n2;
statement S;
identifier f1,f2;
expression E1,E2;
constant C;
@@

n = of_find_node_by_type(...)
...
if (!n) S
... when != of_node_put(n)
    when != n1 = f1(n,...)
    when != E1 = n
    when any
    when strict
(
+ of_node_put(n);
  return -C;
|
  of_node_put(n);
|
  n2 = f2(n,...)
|
  E2 = n
|
  return ...;
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/drivers/video/fsl-diu-fb.c b/drivers/video/fsl-diu-fb.c
--- a/drivers/video/fsl-diu-fb.c
+++ b/drivers/video/fsl-diu-fb.c
@@ -1664,8 +1664,10 @@ static int __init fsl_diu_init(void)
 	}
 
 	prop = of_get_property(np, "d-cache-size", NULL);
-	if (prop = NULL)
+	if (prop = NULL) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	/* Freescale PLRU requires 13/8 times the cache size to do a proper
 	   displacement flush
@@ -1674,8 +1676,10 @@ static int __init fsl_diu_init(void)
 	coherence_data_size /= 8;
 
 	prop = of_get_property(np, "d-cache-line-size", NULL);
-	if (prop = NULL)
+	if (prop = NULL) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 	d_cache_line_size = *prop;
 
 	of_node_put(np);
 	
