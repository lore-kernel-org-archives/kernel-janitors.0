From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:49:52 +0000
Subject: [PATCH 28] drivers/net/wan/hdlc_fr.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311949.52337.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Krzysztof Halasa <khc@pm.waw.pl>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/net/wan/hdlc_fr.c | 31260 -> 31223 (-37 bytes)
 drivers/net/wan/hdlc_fr.o | 144872 -> 144728 (-144 bytes)

 drivers/net/wan/hdlc_fr.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/net/wan/hdlc_fr.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/net/wan/hdlc_fr.c	2007-07-30 00:25:40.000000000 +0200
@@ -212,14 +212,13 @@ static pvc_device* add_pvc(struct net_de
 		pvc_p = &(*pvc_p)->next;
 	}

-	pvc = kmalloc(sizeof(pvc_device), GFP_ATOMIC);
+	pvc = kzalloc(sizeof(pvc_device), GFP_ATOMIC);
 #ifdef DEBUG_PVC
 	printk(KERN_DEBUG "add_pvc: allocated pvc %p, frad %p\n", pvc, dev);
 #endif
 	if (!pvc)
 		return NULL;

-	memset(pvc, 0, sizeof(pvc_device));
 	pvc->dlci = dlci;
 	pvc->frad = dev;
 	pvc->next = *pvc_p;	/* Put it in the chain */
