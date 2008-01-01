From: Julia Lawall <julia@diku.dk>
Date: Tue, 01 Jan 2008 21:03:53 +0000
Subject: [PATCH 3/3] arch/powerpc/platforms/82xx: Add missing of_node_put
Message-Id: <Pine.LNX.4.64.0801012202560.19803@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vbordug@ru.mvista.com, marcelo@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Of_get_parent and of_find_compatible_node do a of_node_get, and thus a
corresponding of_code_put is needed in both the error case and the normal
return case.


The problem was found using the following semantic match.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T,T1,T2;
identifier E;
statement S;
expression x1,x2,x3;
int ret;
@@

  T E;
  ...
* E = \(of_get_parent\|of_find_compatible_node\)(...);
  if (E = NULL) S
  ... when != of_node_put(...,(T1)E,...)
      when != if (E != NULL) { ... of_node_put(...,(T1)E,...); ...}
      when != x1 = (T1)E
      when != E = x3;
      when any
  if (...) {
    ... when != of_node_put(...,(T2)E,...)
        when != if (E != NULL) { ... of_node_put(...,(T2)E,...); ...}
        when != x2 = (T2)E
(
*   return;
|
*   return ret;
)
  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/arch/powerpc/platforms/82xx/mpc8272_ads.c b/arch/powerpc/platforms/82xx/mpc8272_ads.c
--- a/arch/powerpc/platforms/82xx/mpc8272_ads.c	2007-10-22 11:24:59.000000000 +0200
+++ b/arch/powerpc/platforms/82xx/mpc8272_ads.c	2008-01-01 14:35:37.000000000 +0100
@@ -134,13 +134,12 @@ static void __init mpc8272_ads_setup_arc
 	}
 
 	bcsr = of_iomap(np, 0);
+	of_node_put(np);
 	if (!bcsr) {
 		printk(KERN_ERR "Cannot map BCSR registers\n");
 		return;
 	}
 
-	of_node_put(np);
-
 	clrbits32(&bcsr[1], BCSR1_RS232_EN1 | BCSR1_RS232_EN2 | BCSR1_FETHIEN);
 	setbits32(&bcsr[1], BCSR1_FETH_RST);
 
diff -u -p a/arch/powerpc/platforms/82xx/pq2fads.c b/arch/powerpc/platforms/82xx/pq2fads.c
--- a/arch/powerpc/platforms/82xx/pq2fads.c	2007-10-22 11:24:59.000000000 +0200
+++ b/arch/powerpc/platforms/82xx/pq2fads.c	2008-01-01 14:36:28.000000000 +0100
@@ -130,13 +130,12 @@ static void __init pq2fads_setup_arch(vo
 	}
 
 	bcsr = of_iomap(np, 0);
+	of_node_put(np);
 	if (!bcsr) {
 		printk(KERN_ERR "Cannot map BCSR registers\n");
 		return;
 	}
 
-	of_node_put(np);
-
 	/* Enable the serial and ethernet ports */
 
 	clrbits32(&bcsr[1], BCSR1_RS232_EN1 | BCSR1_RS232_EN2 | BCSR1_FETHIEN);
