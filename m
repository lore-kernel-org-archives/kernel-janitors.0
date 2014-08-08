From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 Aug 2014 10:07:47 +0000
Subject: =?UTF-8?q?=5BPATCH=204/14=5D=20powerpc/pseries=3A=20delete=20unneeded=20test=20before=20of=5Fnode=5F
Message-Id: <1407492475-26283-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Of_node_put supports NULL as its argument, so the initial test is not
necessary.

Suggested by Uwe Kleine-K=C3=B6nig.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

-if (e)
   of_node_put(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/powerpc/platforms/pseries/iommu.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platform=
s/pseries/iommu.c
index 33b552f..2ea6831 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -575,8 +575,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *b=
us)
 	while (isa_dn && isa_dn !=3D dn)
 		isa_dn =3D isa_dn->parent;
=20
-	if (isa_dn_orig)
-		of_node_put(isa_dn_orig);
+	of_node_put(isa_dn_orig);
=20
 	/* Count number of direct PCI children of the PHB. */
 	for (children =3D 0, tmp =3D dn->child; tmp; tmp =3D tmp->sibling)

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
