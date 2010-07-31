From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 31 Jul 2010 16:34:30 +0000
Subject: [PATCH] video: igafb: introduce lost 'return'
Message-Id: <1280594070-3328-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

If iga_init() fails, code releases resources and continues to use it.
It seems that after releasing resources 'return' should be.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/video/igafb.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/igafb.c b/drivers/video/igafb.c
index 15d2001..c4e6fc0 100644
--- a/drivers/video/igafb.c
+++ b/drivers/video/igafb.c
@@ -531,6 +531,7 @@ int __init igafb_init(void)
 		iounmap(info->screen_base);
 		kfree(par->mmap_map);
 		kfree(info);
+		return -ENODEV;
         }
 
 #ifdef CONFIG_SPARC
-- 
1.7.0.4

