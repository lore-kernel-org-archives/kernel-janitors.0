From: Dan Carpenter <error27@gmail.com>
Date: Sun, 20 Mar 2011 11:11:31 +0000
Subject: [patch] Staging: westbridge/astoria: unlock on error path
Message-Id: <20110320111130.GG2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is an unlock missing on this error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This driver does not compile for me.

diff --git a/drivers/staging/westbridge/astoria/gadget/cyasgadget.c b/drivers/staging/westbridge/astoria/gadget/cyasgadget.c
index defa05c..be851ca 100644
--- a/drivers/staging/westbridge/astoria/gadget/cyasgadget.c
+++ b/drivers/staging/westbridge/astoria/gadget/cyasgadget.c
@@ -587,6 +587,7 @@ static int cyasgadget_enable(
 			"cy_as_usb_end_point_config EP %s mismatch "
 			"on enabled\n", an_ep->usb_ep_inst.name);
 		#endif
+		spin_unlock_irqrestore(&an_dev->lock, flags);
 		return -EINVAL;
 	}
 
