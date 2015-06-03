From: chaehyun lim <chaehyun.lim@gmail.com>
Date: Wed, 03 Jun 2015 04:52:26 +0000
Subject: [PATCH 8/8] staging : wilc1000 : remove WILC_Sint64
Message-Id: <1433307146-30840-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove WILC_Sint64 that is never used in the driver.

Signed-off-by: chaehyun lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/wilc_oswrapper.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 1c6f1d9..06c1223 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -13,9 +13,6 @@
 /* OS Wrapper interface version */
 #define WILC_OSW_INTERFACE_VER 2
 
-/* Integer Types */
-typedef signed long long WILC_Sint64;
-
 /* Floating types */
 typedef float WILC_Float;
 typedef double WILC_Double;
-- 
1.9.1

