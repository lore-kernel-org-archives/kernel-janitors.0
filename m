From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Thu, 11 Jun 2015 05:35:58 +0000
Subject: [PATCH V3 7/9] staging: wilc1000: remove WILC_Sint16
Message-Id: <1434000960-16909-7-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use s16 instead of WILC_Sint16.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V3: rebased on the top of staging-testing
V2: remove the spaces on the subject
    capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c | 2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index f51bfa4..cff3ff8 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -174,7 +174,7 @@ static tstrConfigPktInfo gstrConfigPktInfo;
 
 static u8 g_seqno;
 
-static WILC_Sint16 g_wid_num          = -1;
+static s16 g_wid_num          = -1;
 
 static u16 Res_Len;
 
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index 7e84475..6deec34 100644
--- a/drivers/staging/wilc1000/wilc_oswrapper.h
+++ b/drivers/staging/wilc1000/wilc_oswrapper.h
@@ -14,7 +14,6 @@
 #define WILC_OSW_INTERFACE_VER 2
 
 /* Integer Types */
-typedef signed short WILC_Sint16;
 typedef signed int WILC_Sint32;
 typedef signed long long WILC_Sint64;
 
-- 
1.9.1

