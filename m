From: Firo Yang <firogm@gmail.com>
Date: Mon, 15 Jun 2015 14:43:56 +0000
Subject: [PATCH] um: Fix a build error
Message-Id: <1434379436-8301-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Gcc5 failed to build uml.
Update codes to test __GNUC__ with 5 will be happier.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/um/include/shared/init.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/include/shared/init.h b/arch/um/include/shared/init.h
index b3906f8..3af7098 100644
--- a/arch/um/include/shared/init.h
+++ b/arch/um/include/shared/init.h
@@ -54,7 +54,7 @@ typedef void (*exitcall_t)(void);
 #endif
 
 #else
-#if __GNUC__ = 4
+#if __GNUC__ = 4 || __GNUC__ = 5
 # define __used			__attribute__((__used__))
 #endif
 #endif
-- 
2.4.3

