From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 09 Jan 2012 07:51:03 +0000
Subject: [PATCH] drivers/staging/omapdrm/omap_fbdev.c: move free after uses
Message-Id: <1326095463-8545-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

Move the free after the final uses.

The semantic patch that makes this report is available
in scripts/coccinelle/free/kfree.cocci.

More information about semantic patching is available at
http://coccinelle.lip6.fr/

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/omapdrm/omap_fbdev.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/omapdrm/omap_fbdev.c b/drivers/staging/omapdrm/omap_fbdev.c
index 093ae2f..c64b87c 100644
--- a/drivers/staging/omapdrm/omap_fbdev.c
+++ b/drivers/staging/omapdrm/omap_fbdev.c
@@ -362,11 +362,11 @@ void omap_fbdev_free(struct drm_device *dev)
 
 	fbdev = to_omap_fbdev(priv->fbdev);
 
-	kfree(fbdev);
-
 	/* this will free the backing object */
 	if (fbdev->fb)
 		fbdev->fb->funcs->destroy(fbdev->fb);
 
+	kfree(fbdev);
+
 	priv->fbdev = NULL;
 }

