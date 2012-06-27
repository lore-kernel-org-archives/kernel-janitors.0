From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2012 08:59:36 +0000
Subject: [patch -resend] [SCSI] bfa: off by one in bfa_ioc_mbox_isr()
Message-Id: <20120627085936.GA31212@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
In-Reply-To: <20120627085800.GA3007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jing Huang <huangj@brocade.com>
Cc: Krishna C Gudipati <kgudipat@brocade.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If mc = BFI_MC_MAX then we're reading past the end of the
mod->mbhdlr[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Originally sent on Wed, 6 Jul 2011.

diff --git a/drivers/scsi/bfa/bfa_ioc.c b/drivers/scsi/bfa/bfa_ioc.c
index 14e6284..8cdb79c 100644
--- a/drivers/scsi/bfa/bfa_ioc.c
+++ b/drivers/scsi/bfa/bfa_ioc.c
@@ -2357,7 +2357,7 @@ bfa_ioc_mbox_isr(struct bfa_ioc_s *ioc)
 			return;
 		}
 
-		if ((mc > BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
+		if ((mc >= BFI_MC_MAX) || (mod->mbhdlr[mc].cbfn = NULL))
 			return;
 
 		mod->mbhdlr[mc].cbfn(mod->mbhdlr[mc].cbarg, &m);
