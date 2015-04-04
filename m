From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 04 Apr 2015 14:59:30 +0000
Subject: [PATCH 2/2] staging: emxx_udc: test returned value
Message-Id: <1428159570-19467-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Put NULL test on the result of the previous call instead on one of its
arguments.  A simplified version of the semantic match that finds this
problem is as follows (http://coccinelle.lip6.fr/):

// <smpl>
r@
expression *e1;
expression *e2;
identifier f;
statement S1,S2;
@@

e1 = f(...,e2,...);
(
if (e1 = NULL || ...) S1 else S2
|
*if (e2 = NULL || ...) S1 else S2
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/emxx_udc/emxx_udc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index fbf82bc..7de1e9e 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2998,7 +2998,7 @@ static void  nbu2ss_ep_fifo_flush(struct usb_ep *_ep)
 	}
 
 	ep = container_of(_ep, struct nbu2ss_ep, ep);
-	if (!_ep) {
+	if (!ep) {
 		pr_err("udc: %s, bad ep\n", __func__);
 		return;
 	}

