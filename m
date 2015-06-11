From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:36:00 +0000
Subject: [PATCH V3 9/9] staging: wilc1000: remove WILC_Sint64
Message-Id: <1434000960-16909-9-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

remove unused WILC_Sint64.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V3: rebased on the top of staging-testing
V2: remove the spaces on the subject
    capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/wilc_oswrapper.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index f9a5a3a..016f964 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -13,9 +13,6 @@
 /* OS Wrapper interface version */
 #define WILC_OSW_INTERFACE_VER 2
 
-/* Integer Types */
-typedef signed long long WILC_Sint64;
-
 /* Boolean type */
 typedef enum {
 	WILC_FALSE = 0,
-- 
1.9.1

