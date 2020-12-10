From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 10 Dec 2020 14:49:32 +0000
Subject: [PATCH 2/2] video: fbdev: Fix a dev_err format specifier
Message-Id: <20201210144932.64436-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.vetter@ffwll.ch, grandmaster@al2klimov.de
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

'phys_addr' is of type 'dma_addr_t'.
Use '%pad' instead of '%x' to print this variable in an error message.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/fbdev/ep93xx-fb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 80a70e5796b8..6b5a63b80ffa 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -436,9 +436,8 @@ static int ep93xxfb_alloc_videomem(struct fb_info *info)
 	 * least.
 	 */
 	if (check_screenpage_bug && phys_addr & (1 << 27)) {
-		dev_err(info->dev, "ep93xx framebuffer bug. phys addr (0x%x) "
-			"has bit 27 set: cannot init framebuffer\n",
-			phys_addr);
+		dev_err(info->dev, "ep93xx framebuffer bug. phys addr (%pad) has bit 27 set: cannot init framebuffer\n",
+			&phys_addr);
 
 		dma_free_coherent(info->dev, fb_size, virt_addr, phys_addr);
 		return -ENOMEM;
-- 
2.27.0
