From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 20 Nov 2015 20:33:20 +0000
Subject: [PATCH 2/6] powerpc/pseries: add missing of_node_put
Message-Id: <1448051604-25256-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448051604-25256-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448051604-25256-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_node_by_type performs an of_node_get on each iteration, so a break
out of the loop requires an of_node_put.  In this code, there are two paths
that break out of the loop.  In the first one (open-pic case), the code
originally contained an of_node_get.  That increments the reference count,
which cancels out against the decrement of the reference count that is
needed here, and thus the patch drops the of_node_get.  In the second one
(ppc-xicp case), there is no need to save the node value, and so an
of_node_put is added as described by the following semantic patch rule
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression e,e1;
local idexpression n;
@@

 for_each_node_by_type(n, e1) {
   ... when != of_node_put(n)
       when != e = n
(
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/powerpc/platforms/pseries/setup.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 36df46e..7185cd3 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -236,7 +236,7 @@ static void __init pseries_discover_pic(void)
 	for_each_node_by_name(np, "interrupt-controller") {
 		typep = of_get_property(np, "compatible", NULL);
 		if (strstr(typep, "open-pic")) {
-			pSeries_mpic_node = of_node_get(np);
+			pSeries_mpic_node = np;
 			ppc_md.init_IRQ       = pseries_mpic_init_IRQ;
 			setup_kexec_cpu_down_mpic();
 			smp_init_pseries_mpic();
@@ -245,6 +245,7 @@ static void __init pseries_discover_pic(void)
 			ppc_md.init_IRQ       = pseries_xics_init_IRQ;
 			setup_kexec_cpu_down_xics();
 			smp_init_pseries_xics();
+			of_node_put(np);
 			return;
 		}
 	}

