From: Colin King <colin.king@canonical.com>
Date: Sat, 08 Feb 2020 16:18:02 +0000
Subject: [PATCH] usb: cdns3: remove redundant assignment to pointer trb
Message-Id: <20200208161802.28846-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer trb being assigned with a value that is never read, it is
assigned a new value later on. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 736b0c6e27fe..3c05080a9ad5 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1380,7 +1380,7 @@ static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
 				  struct cdns3_request *priv_req)
 {
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
-	struct cdns3_trb *trb = priv_req->trb;
+	struct cdns3_trb *trb;
 	int current_index = 0;
 	int handled = 0;
 	int doorbell;
-- 
2.25.0
