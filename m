From: Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Sep 2010 23:41:44 +0000
Subject: [patch -next] bna: off by one
Message-Id: <20100918234144.GB6236@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rmody@brocade.com>
Cc: Debashis Dutt <ddutt@brocade.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

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
