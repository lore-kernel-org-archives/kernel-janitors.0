From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Fri, 16 Jul 2010 15:09:11 +0000
Subject: [PATCH] clear code: add macro wrapper for header mbcache.h
Message-Id: <4C407617.6080002@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org

Hi,

In header file include/linux/mbcache.h, no macro wrapper defined.
I think it's better to add ifndef/define macro to wrap it.
Following patch is against 2.6.35-rc5. Please check it.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 include/linux/mbcache.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/mbcache.h b/include/linux/mbcache.h
index a09b84e..3a6a802 100644
--- a/include/linux/mbcache.h
+++ b/include/linux/mbcache.h
@@ -3,6 +3,8 @@

   (C) 2001 by Andreas Gruenbacher, <a.gruenbacher@computer.org>
 */
+#ifndef __LINUX_MBCACHE_H
+#define __LINUX_MBCACHE_H

 /* Hardwire the number of additional indexes */
 #define MB_CACHE_INDEXES_COUNT 1
@@ -50,3 +52,5 @@ struct mb_cache_entry *mb_cache_entry_find_next(struct
mb_cache_entry *, int,
 						struct block_device *,
 						unsigned int);
 #endif
+
+#endif /* __LINUX_MBCACHE_H */
-- 
1.7.1.1


-- 
Thanks and Regards,
shenghui
