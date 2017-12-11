From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Dec 2017 16:45:36 +0000
Subject: [PATCH][usb-next] usb: xhci: make function xhci_dbc_free_req static
Message-Id: <20171211164536.31425-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function xhci_dbc_free_req is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warning:
symbol 'xhci_dbc_free_req' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 48811d72a94c..8d47b6fbf973 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -122,7 +122,7 @@ static void dbc_write_complete(struct xhci_hcd *xhci, struct dbc_request *req)
 	spin_unlock(&port->port_lock);
 }
 
-void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
+static void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
 {
 	kfree(req->buf);
 	dbc_free_request(dep, req);
-- 
2.14.1

