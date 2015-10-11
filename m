From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 11 Oct 2015 20:27:40 +0000
Subject: [PATCH] powerpc/mpc5xxx: Use of_get_next_parent to simplify code
Message-Id: <1444595260-3332-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

of_get_next_parent can be used to simplify the while() loop and
avoid the need of a temp variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/sysdev/mpc5xxx_clocks.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/mpc5xxx_clocks.c b/arch/powerpc/sysdev/mpc5xxx_clocks.c
index f4f0301..5732926 100644
--- a/arch/powerpc/sysdev/mpc5xxx_clocks.c
+++ b/arch/powerpc/sysdev/mpc5xxx_clocks.c
@@ -13,7 +13,6 @@
 
 unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
 {
-	struct device_node *np;
 	const unsigned int *p_bus_freq = NULL;
 
 	of_node_get(node);
@@ -22,9 +21,7 @@ unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
 		if (p_bus_freq)
 			break;
 
-		np = of_get_parent(node);
-		of_node_put(node);
-		node = np;
+		node = of_get_next_parent(node);
 	}
 	of_node_put(node);
 
-- 
2.1.4

