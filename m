From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Mar 2010 10:54:08 +0000
Subject: [patch] nuc900fb: release correct mem region
Message-Id: <20100325105408.GD5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

We should be releasing "res->start" here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
BTW.  Congratulations on being an official driver maintainer now.  :)  Can
you add yourself to the MAINTAINERS file?

diff --git a/drivers/video/nuc900fb.c b/drivers/video/nuc900fb.c
index 6bf0d46..d4cde79 100644
--- a/drivers/video/nuc900fb.c
+++ b/drivers/video/nuc900fb.c
@@ -667,7 +667,7 @@ release_irq:
 release_regs:
 	iounmap(fbi->io);
 release_mem_region:
-	release_mem_region((unsigned long)fbi->mem, size);
+	release_mem_region(res->start, size);
 free_fb:
 	framebuffer_release(fbinfo);
 	return ret;
