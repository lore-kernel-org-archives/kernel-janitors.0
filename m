From: Daniel van Gerpen <daniel@vangerpen.de>
Date: Mon, 23 May 2016 13:19:14 +0000
Subject: [PATCH 1/2] gcov: use canonical include guard style
Message-Id: <20160523151914.2d1e0fa9@newton>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>
---
 kernel/gcov/gcov.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/gcov/gcov.h b/kernel/gcov/gcov.h
index 92c8e22..5e8fa86 100644
--- a/kernel/gcov/gcov.h
+++ b/kernel/gcov/gcov.h
@@ -12,7 +12,7 @@
  */
 
 #ifndef GCOV_H
-#define GCOV_H GCOV_H
+#define GCOV_H
 
 #include <linux/types.h>
 
-- 
1.9.1


