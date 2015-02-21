From: Matteo Semenzato <mattew8898@gmail.com>
Date: Sat, 21 Feb 2015 09:40:02 +0000
Subject: [PATCH] Staging: vt6655 fix C99 style comments
Message-Id: <1424511602-10037-1-git-send-email-mattew8898@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Matt <mattew8898@gmail.com>

Signed-off-by: Matteo Semenzato <mattew8898@gmail.com>
---
 drivers/staging/vt6655/tmacro.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/tmacro.h b/drivers/staging/vt6655/tmacro.h
index 607b78f..597efef 100644
--- a/drivers/staging/vt6655/tmacro.h
+++ b/drivers/staging/vt6655/tmacro.h
@@ -55,4 +55,4 @@
 #define MAKEDWORD(lw, hw)   ((unsigned long)(((unsigned short)(lw)) | (((unsigned long)((unsigned short)(hw))) << 16)))
 #endif
 
-#endif // __TMACRO_H__
+#endif /* __TMACRO_H__ */
-- 
2.3.0

