From: Debashis Dutt <ddutt@Brocade.COM>
Date: Sun, 19 Sep 2010 00:48:47 +0000
Subject: RE: [patch -next] bna: off by one
Message-Id: <F363E7AC84E1B646A0358B281A46F4AEAA37503363@HQ1-EXCH03.corp.brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100918234144.GB6236@bicker>
In-Reply-To: <20100918234144.GB6236@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Rasesh Mody <rmody@brocade.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



-----Original Message-----
From: Dan Carpenter [mailto:error27@gmail.com] 
Sent: Saturday, September 18, 2010 4:42 PM
To: Rasesh Mody
Cc: Debashis Dutt; David S. Miller; netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: [patch -next] bna: off by one

The mod->mbhdlr[] array has BFI_MC_MAX elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/bna/bfa_ioc.c b/drivers/net/bna/bfa_ioc.c
index caa45c2..73493de 100644
--- a/drivers/net/bna/bfa_ioc.c
+++ b/drivers/net/bna/bfa_ioc.c
@@ -1514,7 +1514,7 @@ bfa_nw_ioc_mbox_isr(struct bfa_ioc *ioc)
 		return;
 	}
 
-	if ((mc > BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
+	if ((mc >= BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
 		return;
 
 	mod->mbhdlr[mc].cbfn(mod->mbhdlr[mc].cbarg, &m);

Dan,

Patch looks good. 

Thanks
--Debashis
