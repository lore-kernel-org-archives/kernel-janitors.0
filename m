From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Mon, 15 Jun 2015 03:35:48 +0000
Subject: [PATCH] staging: wilc1000: align defines
Message-Id: <1434339348-6654-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Align the lines of some defines in wilc_errorsupport.h

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/wilc_errorsupport.h | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/wilc1000/wilc_errorsupport.h b/drivers/staging/wilc1000/wilc_errorsupport.h
index 6963a46..b9517dc 100644
--- a/drivers/staging/wilc1000/wilc_errorsupport.h
+++ b/drivers/staging/wilc1000/wilc_errorsupport.h
@@ -13,26 +13,26 @@
 #include "linux_wlan_common.h"
 
 /* Psitive Numbers to indicate sucess with special status */
-#define	WILC_ALREADY_EXSIT	(+100)    /** The requested object already exists */
+#define WILC_ALREADY_EXSIT	(+100)    /** The requested object already exists */
 
 /* Generic success will return 0 */
-#define WILC_SUCCESS		0       /** Generic success */
+#define WILC_SUCCESS	0       /** Generic success */
 
 /* Negative numbers to indicate failures */
-#define	WILC_FAIL                -100   /** Generic Fail */
-#define	WILC_BUSY                -101   /** Busy with another operation*/
-#define	WILC_INVALID_ARGUMENT    -102   /** A given argument is invalid*/
-#define	WILC_INVALID_STATE		-103    /** An API request would violate the Driver state machine (i.e. to start PID while not camped)*/
-#define	WILC_BUFFER_OVERFLOW     -104   /** In copy operations if the copied data is larger than the allocated buffer*/
-#define WILC_NULL_PTR		-105    /** null pointer is passed or used */
-#define	WILC_EMPTY               -107
-#define WILC_FULL				-108
-#define	WILC_TIMEOUT			-109
-#define WILC_CANCELED		-110    /** The required operation have been canceled by the user*/
-#define WILC_INVALID_FILE	-112    /** The Loaded file is corruped or having an invalid format */
-#define WILC_NOT_FOUND		-113    /** Cant find the file to load */
-#define WILC_NO_MEM		-114
-#define WILC_UNSUPPORTED_VERSION -115
+#define WILC_FAIL			-100 /** Generic Fail */
+#define WILC_BUSY			-101 /** Busy with another operation*/
+#define WILC_INVALID_ARGUMENT		-102 /** A given argument is invalid*/
+#define WILC_INVALID_STATE		-103 /** An API request would violate the Driver state machine (i.e. to start PID while not camped)*/
+#define WILC_BUFFER_OVERFLOW		-104 /** In copy operations if the copied data is larger than the allocated buffer*/
+#define WILC_NULL_PTR			-105 /** null pointer is passed or used */
+#define WILC_EMPTY			-107
+#define WILC_FULL			-108
+#define WILC_TIMEOUT			-109
+#define WILC_CANCELED			-110 /** The required operation have been canceled by the user*/
+#define WILC_INVALID_FILE		-112 /** The Loaded file is corruped or having an invalid format */
+#define WILC_NOT_FOUND			-113 /** Cant find the file to load */
+#define WILC_NO_MEM			-114
+#define WILC_UNSUPPORTED_VERSION	-115
 #define WILC_FILE_EOF			-116
 
 
-- 
1.9.1

