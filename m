From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Nov 2017 16:18:28 +0000
Subject: [PATCH] USB: gadget: don't dereference g until after it has been null checked
Message-Id: <20171114161828.31967-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Avoid dereferencing pointer g until after g has been sanity null checked;
move the assignment of cdev much later when it is required into a more
local scope.

Detected by CoverityScan, CID#1222135 ("Dereference before null check")

Fixes: b785ea7ce662 ("usb: gadget: composite: fix ep->maxburst initialization")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/composite.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index eec14e6ed20b..77c7ecca816a 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -146,7 +146,6 @@ int config_ep_by_speed(struct usb_gadget *g,
 			struct usb_function *f,
 			struct usb_ep *_ep)
 {
-	struct usb_composite_dev	*cdev = get_gadget_data(g);
 	struct usb_endpoint_descriptor *chosen_desc = NULL;
 	struct usb_descriptor_header **speed_desc = NULL;
 
@@ -226,8 +225,12 @@ int config_ep_by_speed(struct usb_gadget *g,
 			_ep->maxburst = comp_desc->bMaxBurst + 1;
 			break;
 		default:
-			if (comp_desc->bMaxBurst != 0)
+			if (comp_desc->bMaxBurst != 0) {
+				struct usb_composite_dev *cdev;
+
+				cdev = get_gadget_data(g);
 				ERROR(cdev, "ep0 bMaxBurst must be 0\n");
+			}
 			_ep->maxburst = 1;
 			break;
 		}
-- 
2.14.1

