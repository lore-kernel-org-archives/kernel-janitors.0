From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Dec 2007 20:00:38 +0000
Subject: Subject: [PATCH] arch/powerpc/platforms/powermac: Drop unneeded
Message-Id: <Pine.LNX.4.64.0712022058570.3361@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

After using for_each_node_by_name, there is no need for of_node_put unless
there was a break in the loop body, as for_each_node_by_name does a
of_node_put on each of the elements it returns.

This was detected and fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
iterator for_each_node_by_name;
expression d;
@@

  for_each_node_by_name(d,...) {
    ... when != break;
  }
  ... when != d
?- of_node_put(d);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
--- a/arch/powerpc/platforms/powermac/feature.c 2007-08-12 13:27:05.000000000 +0200
+++ b/arch/powerpc/platforms/powermac/feature.c 2007-12-02 17:16:04.000000000 +0100
@@ -2861,7 +2861,6 @@ set_initial_features(void)
 				core99_airport_enable(np, 0, 0);
 			}
 		}
-		of_node_put(np);
 	}
 
 	/* On all machines that support sound PM, switch sound off */
diff -u -p a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platforms/powermac/pci.c
--- a/arch/powerpc/platforms/powermac/pci.c 2007-10-22 11:24:59.000000000 +0200
+++ b/arch/powerpc/platforms/powermac/pci.c 2007-12-02 17:16:05.000000000 +0100
@@ -1162,13 +1162,11 @@ void __init pmac_pcibios_after_init(void
 			pmac_call_feature(PMAC_FTR_1394_CABLE_POWER, nd, 0, 0);
 		}
 	}
-	of_node_put(nd);
 	for_each_node_by_name(nd, "ethernet") {
 		if (nd->parent && of_device_is_compatible(nd, "gmac")
 		    && of_device_is_compatible(nd->parent, "uni-north"))
 			pmac_call_feature(PMAC_FTR_GMAC_ENABLE, nd, 0, 0);
 	}
-	of_node_put(nd);
 }
 
 #ifdef CONFIG_PPC32
