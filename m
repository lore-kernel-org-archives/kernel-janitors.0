From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 06 Apr 2005 15:11:54 +0000
Subject: [KJ] [PATCH] kfree instead of kfree_skb : drivers/net/acenic.c
Message-Id: <20050406151154.GG10979@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ieNMXl1Fr3cevapt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050406075033.GA10979@rhum.iomeda.fr>
In-Reply-To: <20050406075033.GA10979@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
Make sure no-one is freeing skbs with kfree instead of kfree_skb
from http://kerneljanitors.org/TODO

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="2.6.12-rc2-kj-kfree_skb-drivers_net_acenic.c.patch"

diff -urpN -X dontdiff a/drivers/net/acenic.c b/drivers/net/acenic.c
--- a/drivers/net/acenic.c	2005-04-06 08:57:16.000000000 +0200
+++ b/drivers/net/acenic.c	2005-04-06 16:46:01.915382688 +0200
@@ -872,7 +872,7 @@ static void ace_init_cleanup(struct net_
 		pci_free_consistent(ap->pdev, sizeof(struct ace_info),
 				    ap->info, ap->info_dma);
 	if (ap->skb)
-		kfree(ap->skb);
+		kfree_skb(ap->skb);
 	if (ap->trace_buf)
 		kfree(ap->trace_buf);

--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--ieNMXl1Fr3cevapt--
