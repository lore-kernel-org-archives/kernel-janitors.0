From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 06 Apr 2005 07:50:33 +0000
Subject: [KJ] [PATCH] kfree instead of kfree_skb : drivers/net/gianfar.c
Message-Id: <20050406075033.GA10979@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="K8nIJk4ghYZn606h"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
Make sure no-one is freeing skbs with kfree instead of kfree_skb
from http://kerneljanitors.org/TODO

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="2.6.12-rc2-kj-kfree_skb.patch"

diff -urpN -X dontdiff a/drivers/net/gianfar.c b/drivers/net/gianfar.c
--- a/drivers/net/gianfar.c	2005-04-04 18:37:46.000000000 +0200
+++ b/drivers/net/gianfar.c	2005-04-06 09:40:21.813068408 +0200
@@ -591,7 +591,7 @@ void free_skb_resources(struct gfar_priv
 		}
 	}
 
-	kfree(priv->tx_skbuff);
+	kfree_skb(priv->tx_skbuff);
 
 	rxbdp = priv->rx_bd_base;
 
@@ -616,7 +616,7 @@ void free_skb_resources(struct gfar_priv
 			rxbdp++;
 		}
 
-		kfree(priv->rx_skbuff);
+		kfree_skb(priv->rx_skbuff);
 	}
 }
 

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--K8nIJk4ghYZn606h--
