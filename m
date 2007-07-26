From: Andi Drebes <lists-receive@programmierforen.de>
Date: Thu, 26 Jul 2007 14:51:56 +0000
Subject: [KJ] [PATCH] drivers/media/dvb/ttpci/budget-av.c: ARRAY_SIZE()
Message-Id: <200707261651.57148.lists-receive@programmierforen.de>
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
diff --git a/drivers/media/dvb/ttpci/budget-av.c b/drivers/media/dvb/ttpci/budget-av.c
index 0aee7a1..3439c98 100644
--- a/drivers/media/dvb/ttpci/budget-av.c
+++ b/drivers/media/dvb/ttpci/budget-av.c
@@ -1232,7 +1232,7 @@ static struct saa7146_ext_vv vv_data = {
 	.capabilities = 0,	// perhaps later: V4L2_CAP_VBI_CAPTURE, but that need tweaking with the saa7113
 	.flags = 0,
 	.stds = &standard[0],
-	.num_stds = sizeof(standard) / sizeof(struct saa7146_standard),
+	.num_stds = ARRAY_SIZE(standard),
 	.ioctls = &ioctls[0],
 	.ioctl = av_ioctl,
 };
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
