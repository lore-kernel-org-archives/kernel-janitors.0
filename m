From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 28 May 2015 21:02:23 +0000
Subject: [PATCH 8/9] staging/lustre/mdc: drop unneeded goto
Message-Id: <1432846944-7122-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete jump to a label on the next line, when that label is not
used elsewhere.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier l;
@@

-if (...) goto l;
-l:
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/mdc/mdc_request.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/lustre/lustre/mdc/mdc_request.c b/drivers/staging/lustre/lustre/mdc/mdc_request.c
index cbbdfce..0f120f2 100644
--- a/drivers/staging/lustre/lustre/mdc/mdc_request.c
+++ b/drivers/staging/lustre/lustre/mdc/mdc_request.c
@@ -1818,10 +1818,7 @@ static int mdc_ioc_swap_layouts(struct obd_export *exp,
 	ptlrpc_request_set_replen(req);
 
 	rc = ptlrpc_queue_wait(req);
-	if (rc)
-		goto out;
 
-out:
 	ptlrpc_req_finished(req);
 	return rc;
 }

