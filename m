From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 26 Jul 2007 14:56:16 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/dvb-usb/vp7045.c: ARRAY_SIZE()
Message-Id: <200707261656.16323.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch replaces an array size calculation done using sizeof
with an invocation of the ARRAY_SIZE macro.

Please CC me for any comments.

Tested by compilation on an i386 box using "allyesconfig".
Diffed against Linus' git-tree.

Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
---
diff --git a/drivers/media/dvb/dvb-usb/vp7045.c b/drivers/media/dvb/dvb-usb/vp7045.c
index 69a46b3..5bbd2d5 100644
--- a/drivers/media/dvb/dvb-usb/vp7045.c
+++ b/drivers/media/dvb/dvb-usb/vp7045.c
@@ -159,7 +159,7 @@ static int vp7045_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 		return 0;
 	}
 
-	for (i = 0; i < sizeof(vp7045_rc_keys)/sizeof(struct dvb_usb_rc_key); i++)
+	for (i = 0; i < ARRAY_SIZE(vp7045_rc_keys); i++)
 		if (vp7045_rc_keys[i].data = key) {
 			*state = REMOTE_KEY_PRESSED;
 			*event = vp7045_rc_keys[i].event;
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
