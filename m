From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 05 Oct 2005 03:09:05 +0000
Subject: [KJ] [PATCH] eth1394: fix gfp flags type
Message-Id: <20051004200905.610eb0e9.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55527967982308379=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55527967982308379==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix nocast sparse warnings:
drivers/ieee1394/eth1394.c:1651:46: warning: implicit cast to nocast type
drivers/ieee1394/eth1394.c:1667:35: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 drivers/ieee1394/eth1394.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

diff -Naurp linux-2614-rc2-git6/drivers/ieee1394/eth1394.c~eth1394_gfpmask linux-2614-rc2-git6/drivers/ieee1394/eth1394.c
--- linux-2614-rc2-git6/drivers/ieee1394/eth1394.c~eth1394_gfpmask	2005-08-28 16:41:01.000000000 -0700
+++ linux-2614-rc2-git6/drivers/ieee1394/eth1394.c	2005-10-03 22:35:51.000000000 -0700
@@ -1632,7 +1632,8 @@ static void ether1394_complete_cb(void *
 /* Transmit a packet (called by kernel) */
 static int ether1394_tx (struct sk_buff *skb, struct net_device *dev)
 {
-	int kmflags = in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
+	unsigned int __nocast kmflags =
+				in_interrupt() ? GFP_ATOMIC : GFP_KERNEL;
 	struct eth1394hdr *eth;
 	struct eth1394_priv *priv = netdev_priv(dev);
 	int proto;


---

--===============55527967982308379==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55527967982308379==--
