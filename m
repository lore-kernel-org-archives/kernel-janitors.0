From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 20:30:19 +0000
Subject: [PATCH 2/8] drivers/scsi/bfa/bfa_svc.c: drop if around WARN_ON
Message-Id: <1351974625-10282-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krishna C Gudipati <kgudipat@brocade.com>
Cc: kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Just use WARN_ON rather than an if containing only WARN_ON(1).

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@
- if (e) WARN_ON(1);
+ WARN_ON(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/bfa/bfa_svc.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_svc.c b/drivers/scsi/bfa/bfa_svc.c
index 299c1c8..765b8d0 100644
--- a/drivers/scsi/bfa/bfa_svc.c
+++ b/drivers/scsi/bfa/bfa_svc.c
@@ -626,8 +626,7 @@ bfa_fcxp_init_reqrsp(struct bfa_fcxp_s *fcxp,
 		/*
 		 * alloc required sgpgs
 		 */
-		if (n_sgles > BFI_SGE_INLINE)
-			WARN_ON(1);
+		WARN_ON(n_sgles > BFI_SGE_INLINE);
 	}
 
 }

