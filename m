From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:15:06 +0000
Subject: [PATCH 09/15] usb: host: check kzalloc() result
Message-Id: <1279296906-25107-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Mike Frysinger <vapier@gentoo.org>, Alan Stern <stern@rowland.harvard.edu>, Michael Hennerich <michael.hennerich@analog.com>, Bryan Wu <cooloney@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

If kzalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/usb/host/sl811-hcd.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index bcf9f0e..990f06b 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -813,8 +813,11 @@ static int sl811h_urb_enqueue(
 #endif
 
 	/* avoid all allocations within spinlocks */
-	if (!hep->hcpriv)
+	if (!hep->hcpriv) {
 		ep = kzalloc(sizeof *ep, mem_flags);
+		if (ep = NULL)
+			return -ENOMEM;
+	}
 
 	spin_lock_irqsave(&sl811->lock, flags);
 
-- 
1.7.0.4

