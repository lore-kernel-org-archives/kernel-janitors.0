From: Dan Carpenter <error27@gmail.com>
Date: Mon, 21 Jun 2010 06:45:08 +0000
Subject: [patch] scsi/bfa: off by one in bfa_ioc_mbox_isr()
Message-Id: <20100621064507.GA5940@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jing Huang <huangj@brocade.com>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, Krishna Gudipati <kgudipat@brocade.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be ">=" here instead of ">" so that we don't read past the
end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/bfa/bfa_ioc.c b/drivers/scsi/bfa/bfa_ioc.c
index e038bc9..0ba624d 100644
--- a/drivers/scsi/bfa/bfa_ioc.c
+++ b/drivers/scsi/bfa/bfa_ioc.c
@@ -1595,7 +1595,7 @@ bfa_ioc_mbox_isr(struct bfa_ioc_s *ioc)
 		return;
 	}
 
-	if ((mc > BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
+	if ((mc >= BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
 		return;
 
 	mod->mbhdlr[mc].cbfn(mod->mbhdlr[mc].cbarg, &m);
