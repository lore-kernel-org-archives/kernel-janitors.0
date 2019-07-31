From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 31 Jul 2019 12:52:02 +0000
Subject: [PATCH 2/2] usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in 'xhci_dbc_alloc_requests()'
Message-Id: <557765ac7a028fa77f0e1ac6148ef2c0904f8ab7.1564577335.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1564577335.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to use GFP_ATOMIC to allocate 'req'. GFP_KERNEL should be
enough and is already used for another allocation juste a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I've done my best to check if a spinlock can be hold when reaching this
code. Apparently it is never the case.
But double check to be sure that it is not the kmalloc that should use
GFP_ATOMIC.
---
 drivers/usb/host/xhci-dbgtty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 845939f8a0b8..be726c791323 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -139,7 +139,7 @@ xhci_dbc_alloc_requests(struct dbc_ep *dep, struct list_head *head,
 	struct dbc_request	*req;
 
 	for (i = 0; i < DBC_QUEUE_SIZE; i++) {
-		req = dbc_alloc_request(dep, GFP_ATOMIC);
+		req = dbc_alloc_request(dep, GFP_KERNEL);
 		if (!req)
 			break;
 
-- 
2.20.1
