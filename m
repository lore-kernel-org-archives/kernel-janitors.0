From: Chaehyun Lim <chaehyun.lim@gmail.com>
Date: Fri, 12 Jun 2015 03:38:05 +0000
Subject: [PATCH] staging: wilc1000: remove unused typedef
Message-Id: <1434080285-5142-1-git-send-email-chaehyun.lim@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unused typedef for custom data types.

Signed-off-by: Chaehyun Lim <chaehyun.lim@gmail.com>
---
 drivers/staging/wilc1000/itypes.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/wilc1000/itypes.h b/drivers/staging/wilc1000/itypes.h
index c99f8ca..2441853 100644
--- a/drivers/staging/wilc1000/itypes.h
+++ b/drivers/staging/wilc1000/itypes.h
@@ -36,16 +36,6 @@
 #ifndef ITYPES_H
 #define ITYPES_H
 
-
-/*****************************************************************************/
-/* Data Types                                                                */
-/*****************************************************************************/
-
-typedef int WORD32;
-typedef short WORD16;
-typedef char WORD8;
-typedef unsigned short UWORD16;
-
 /*****************************************************************************/
 /* Enums                                                                     */
 /*****************************************************************************/
-- 
1.9.1

