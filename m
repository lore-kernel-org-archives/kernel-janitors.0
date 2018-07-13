From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:29:56 +0000
Subject: [PATCH] usb: host: ehci-sched: remove redundant pointer dev
Message-Id: <20180713092956.13247-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer dev is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/ehci-sched.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
index 1d87295682b8..da7b00a6110b 100644
--- a/drivers/usb/host/ehci-sched.c
+++ b/drivers/usb/host/ehci-sched.c
@@ -1835,7 +1835,6 @@ static bool itd_complete(struct ehci_hcd *ehci, struct ehci_itd *itd)
 	unsigned				uframe;
 	int					urb_index = -1;
 	struct ehci_iso_stream			*stream = itd->stream;
-	struct usb_device			*dev;
 	bool					retval = false;
 
 	/* for each uframe with a packet */
@@ -1886,7 +1885,6 @@ static bool itd_complete(struct ehci_hcd *ehci, struct ehci_itd *itd)
 	 */
 
 	/* give urb back to the driver; completion often (re)submits */
-	dev = urb->dev;
 	ehci_urb_done(ehci, urb, 0);
 	retval = true;
 	urb = NULL;
@@ -2230,7 +2228,6 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
 	u32					t;
 	int					urb_index;
 	struct ehci_iso_stream			*stream = sitd->stream;
-	struct usb_device			*dev;
 	bool					retval = false;
 
 	urb_index = sitd->index;
@@ -2268,7 +2265,6 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
 	 */
 
 	/* give urb back to the driver; completion often (re)submits */
-	dev = urb->dev;
 	ehci_urb_done(ehci, urb, 0);
 	retval = true;
 	urb = NULL;
-- 
2.17.1

