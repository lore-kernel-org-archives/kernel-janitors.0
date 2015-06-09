From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Tue, 09 Jun 2015 00:19:37 +0000
Subject: [PATCH V2 6/8] staging: wilc1000: remove WILC_Sint16
Message-Id: <1433809179-9769-6-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use s16 in stead of WILC_Sint16.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
V2 : remove the spaces on the subject.
     Capitalize the name on the From and the Signed-off-by

 drivers/staging/wilc1000/coreconfigurator.c | 2 +-
 drivers/staging/wilc1000/wilc_oswrapper.h   | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/wilc1000/coreconfigurator.c b/drivers/staging/wilc1000/coreconfigurator.c
index 50d184c..a060172 100644
--- a/drivers/staging/wilc1000/coreconfigurator.c
+++ b/drivers/staging/wilc1000/coreconfigurator.c
@@ -173,7 +173,7 @@ static tstrConfigPktInfo gstrConfigPktInfo;
 
 static u8 g_seqno;
 
-static WILC_Sint16 g_wid_num          = -1;
+static s16 g_wid_num          = -1;
 
 static u16 Res_Len;
 
diff --git a/drivers/staging/wilc1000/wilc_oswrapper.h b/drivers/staging/wilc1000/wilc_oswrapper.h
index fc09416..dafcfec 100644
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

