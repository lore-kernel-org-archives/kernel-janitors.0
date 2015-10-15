From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 15 Oct 2015 05:56:20 +0000
Subject: [PATCH v2] powerpc/mpc5xxx: Avoid dereferencing potentially freed memory
Message-Id: <1444888580-12966-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151014040011.8AB1514110A@ozlabs.org>
In-Reply-To: <20151014040011.8AB1514110A@ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'of_property_read_u32()' instead of 'of_get_property()'+pointer
dereference in order to avoid access to potentially freed memory.

Use 'of_get_next_parent()' to simplify the while() loop and avoid the
need of a temp variable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Use of_property_read_u32 instead of of_get_property+pointer dereference
*** Untested ***
---
 arch/powerpc/sysdev/mpc5xxx_clocks.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/sysdev/mpc5xxx_clocks.c b/arch/powerpc/sysdev/mpc5xxx_clocks.c
index f4f0301..92fbcf8 100644
--- a/arch/powerpc/sysdev/mpc5xxx_clocks.c
+++ b/arch/powerpc/sysdev/mpc5xxx_clocks.c
@@ -13,21 +13,17 @@
 
 unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
 {
-	struct device_node *np;
-	const unsigned int *p_bus_freq = NULL;
+	u32 bus_freq = 0;
 
 	of_node_get(node);
 	while (node) {
-		p_bus_freq = of_get_property(node, "bus-frequency", NULL);
-		if (p_bus_freq)
+		if (!of_property_read_u32(node, "bus-frequency", &bus_freq))
 			break;
 
-		np = of_get_parent(node);
-		of_node_put(node);
-		node = np;
+		node = of_get_next_parent(node);
 	}
 	of_node_put(node);
 
-	return p_bus_freq ? *p_bus_freq : 0;
+	return bus_freq;
 }
 EXPORT_SYMBOL(mpc5xxx_get_bus_frequency);
-- 
2.1.4

