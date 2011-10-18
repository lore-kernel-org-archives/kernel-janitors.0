From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:25:34 +0000
Subject: [patch 2/2 -next] USB: gadget: midi: memory leak in
Message-Id: <20111018062534.GM27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a small memory leak on the error paths.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/f_midi.c b/drivers/usb/gadget/f_midi.c
index ef1bc7a..67b2229 100644
--- a/drivers/usb/gadget/f_midi.c
+++ b/drivers/usb/gadget/f_midi.c
@@ -951,7 +951,7 @@ int __init f_midi_bind_config(struct usb_configuration *c,
 		struct gmidi_in_port *port = kzalloc(sizeof(*port), GFP_KERNEL);
 		if (!port) {
 			status = -ENOMEM;
-			goto fail;
+			goto setup_fail;
 		}
 
 		port->midi = midi;
@@ -989,6 +989,8 @@ int __init f_midi_bind_config(struct usb_configuration *c,
 	return 0;
 
 setup_fail:
+	for (--i; i >= 0; i--)
+		kfree(midi->in_port[i]);
 	kfree(midi);
 fail:
 	return status;
