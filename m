From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Aug 2011 12:19:08 +0000
Subject: [PATCH] drivers/gpu/vga/vgaarb.c: add missing kfree
Message-Id: <1312892348-22615-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Alex Deucher <alexdeucher@gmail.com>, Daniel J Blueman <daniel.blueman@gmail.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

kbuf is a buffer that is local to this function, so all of the error paths
leaving the function should release it.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/vga/vgaarb.c |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index c72f1c0..18376f1 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -993,14 +993,20 @@ static ssize_t vga_arb_write(struct file *file, const char __user * buf,
 				uc = &priv->cards[i];
 		}
 
-		if (!uc)
-			return -EINVAL;
+		if (!uc) {
+			ret_val = -EINVAL;
+			goto done;
+		}
 
-		if (io_state & VGA_RSRC_LEGACY_IO && uc->io_cnt = 0)
-			return -EINVAL;
+		if (io_state & VGA_RSRC_LEGACY_IO && uc->io_cnt = 0) {
+			ret_val = -EINVAL;
+			goto done;
+		}
 
-		if (io_state & VGA_RSRC_LEGACY_MEM && uc->mem_cnt = 0)
-			return -EINVAL;
+		if (io_state & VGA_RSRC_LEGACY_MEM && uc->mem_cnt = 0) {
+			ret_val = -EINVAL;
+			goto done;
+		}
 
 		vga_put(pdev, io_state);
 

