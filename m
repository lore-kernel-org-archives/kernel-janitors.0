From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 19:28:31 +0000
Subject: [PATCH 3/4] staging: keucr: Delete StringCmp() and StringCopy custom functions
Message-Id: <1293823712-6273-4-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/keucr/smilsub.c |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/keucr/smilsub.c b/drivers/staging/keucr/smilsub.c
index 8256fad..5f20c43 100644
--- a/drivers/staging/keucr/smilsub.c
+++ b/drivers/staging/keucr/smilsub.c
@@ -1592,25 +1592,6 @@ char Bit_D_CountWord(WORD cdata)
     return((char)bitcount);
 }
 
-void StringCopy(char *stringA, char *stringB, int count)
-{
-    int i;
-
-    for(i=0; i<count; i++)
-        *stringA++ = *stringB++;
-}
-
-//-----
-int StringCmp(char *stringA, char *stringB, int count)
-{
-    int i;
-
-    for (i=0;i<count;i++)
-        if (*stringA++ != *stringB++)
-            return(ERROR);
-
-    return(SUCCESS);
-}
 /*
 //----- SM_ReadBlock() ---------------------------------------------
 int SM_ReadBlock(PFDO_DEVICE_EXTENSION fdoExt, BYTE *buf,BYTE *redundant)
-- 
1.7.0.4

