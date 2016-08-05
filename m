From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 05 Aug 2016 08:56:49 +0000
Subject: [PATCH 09/11] powerpc/mpic: use of_property_read_bool
Message-Id: <1470387411-15879-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/powerpc/sysdev/mpic.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 7de45b2..26d9c3f 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1249,7 +1249,7 @@ struct mpic * __init mpic_alloc(struct device_node *node,
 	/* Pick the physical address from the device tree if unspecified */
 	if (!phys_addr) {
 		/* Check if it is DCR-based */
-		if (of_get_property(node, "dcr-reg", NULL)) {
+		if (of_property_read_bool(node, "dcr-reg")) {
 			flags |= MPIC_USES_DCR;
 		} else {
 			struct resource r;

