From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 08 Aug 2014 10:07:43 +0000
Subject: =?UTF-8?q?=5BPATCH=202/14=5D=20net=3A=20axienet=3A=20delete=20unneeded=20test=20before=20of=5Fnode=5
Message-Id: <1407492475-26283-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

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
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/ne=
t/ethernet/xilinx/xilinx_axienet_main.c
index 7b0a735..30e8608 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1630,8 +1630,7 @@ static int axienet_of_remove(struct platform_device *=
op)
 	axienet_mdio_teardown(lp);
 	unregister_netdev(ndev);
=20
-	if (lp->phy_node)
-		of_node_put(lp->phy_node);
+	of_node_put(lp->phy_node);
 	lp->phy_node =3D NULL;
=20
 	iounmap(lp->regs);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
