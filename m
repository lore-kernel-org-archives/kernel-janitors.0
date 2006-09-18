From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Mon, 18 Sep 2006 21:38:56 +0000
Subject: [KJ] [Patch] BUG_ON conversion for drivers/media/video/pwc/pwc-if.c
Message-Id: <1158615536.21907.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this patch converts a if () BUG(); construct to BUG_ON();
which occupies less space, uses unlikely and is safer when
BUG() is disabled.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc7/drivers/media/video/pwc/pwc-if.c.orig	2006-09-18 23:30:21.000000000 +0200
+++ linux-2.6.18-rc7/drivers/media/video/pwc/pwc-if.c	2006-09-18 23:30:36.000000000 +0200
@@ -1082,8 +1082,7 @@ static int pwc_video_open(struct inode *
 	PWC_DEBUG_OPEN(">> video_open called(vdev = 0x%p).\n", vdev);
 
 	pdev = (struct pwc_device *)vdev->priv;
-	if (pdev = NULL)
-		BUG();
+	BUG_ON(!pdev);
 	if (pdev->vopen) {
 		PWC_DEBUG_OPEN("I'm busy, someone is using the device.\n");
 		return -EBUSY;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
