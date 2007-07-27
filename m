From: Andi Drebes <lists-receive@programmierforen.de>
Date: Fri, 27 Jul 2007 12:46:43 +0000
Subject: [PATCH] drivers/media/video/hexium_gemini.c: ARRAY_SIZE()
Message-Id: <200707271446.43874.lists-receive@programmierforen.de>
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
diff --git a/drivers/media/video/hexium_gemini.c b/drivers/media/video/hexium_gemini.c
index c7fed34..fa37097 100644
--- a/drivers/media/video/hexium_gemini.c
+++ b/drivers/media/video/hexium_gemini.c
@@ -512,7 +512,7 @@ static struct saa7146_ext_vv vv_data = {
 	.inputs = HEXIUM_INPUTS,
 	.capabilities = 0,
 	.stds = &hexium_standards[0],
-	.num_stds = sizeof(hexium_standards) / sizeof(struct saa7146_standard),
+	.num_stds = ARRAY_SIZE(hexium_standards),
 	.std_callback = &std_callback,
 	.ioctls = &ioctls[0],
 	.ioctl = hexium_ioctl,
