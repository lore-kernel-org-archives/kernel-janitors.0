From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 06:11:20 +0000
Subject: [patch] Staging: lirc: remove unneeded variable
Message-Id: <20100810061120.GB18431@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We never use control_req so I removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/lirc/lirc_imon.c b/drivers/staging/lirc/lirc_imon.c
index 6649325..cb5699c 100644
--- a/drivers/staging/lirc/lirc_imon.c
+++ b/drivers/staging/lirc/lirc_imon.c
@@ -320,7 +320,6 @@ static int send_packet(struct imon_context *context)
 	unsigned int pipe;
 	int interval = 0;
 	int retval = 0;
-	struct usb_ctrlrequest *control_req = NULL;
 
 	/* Check if we need to use control or interrupt urb */
 	pipe = usb_sndintpipe(context->usbdev,
@@ -355,8 +354,6 @@ static int send_packet(struct imon_context *context)
 			err("%s: packet tx failed (%d)", __func__, retval);
 	}
 
-	kfree(control_req);
-
 	return retval;
 }
 
