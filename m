From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 12:51:50 +0000
Subject: [PATCH 1/2] usb: xhci: dbc: Simplify error handling in 'xhci_dbc_alloc_requests()'
Message-Id: <1593f29b4f9350b2034f20dda60de57409b12965.1564577335.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the 'kmalloc()' fails, we need to undo the previous
'dbc_alloc_request()' call.

Because of the more similar function name, it is more logical to use
'dbc_free_request()' instead of 'xhci_dbc_free_req()'.

Both are equivalent here because:
 static void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
 {
 	kfree(req->buf);
 	dbc_free_request(dep, req);
 }
and 'req->buf' is known to be NULL at this point

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index aff79ff5aba4..845939f8a0b8 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -146,7 +146,7 @@ xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
 		req->length = DBC_MAX_PACKET;
 		req->buf = kmalloc(req->length, GFP_KERNEL);
 		if (!req->buf) {
-			xhci_dbc_free_req(dep, req);
+			dbc_free_request(dep, req);
 			break;
 		}
 
-- 
2.20.1
