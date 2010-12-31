From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Fri, 31 Dec 2010 09:19:22 +0000
Subject: [PATCH 2/4] staging: keucr: Use strncpy() instead of custom StringCopy() and some style cleanups
Message-Id: <1293787164-7056-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/keucr/smilecc.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/keucr/smilecc.c b/drivers/staging/keucr/smilecc.c
index daf322a..f4ff9ac 100644
--- a/drivers/staging/keucr/smilecc.c
+++ b/drivers/staging/keucr/smilecc.c
@@ -182,13 +182,15 @@ BYTE *buf;
 BYTE *redundant_ecc;
 BYTE *calculate_ecc;
 {
-    DWORD err;
-
-    err=correct_data(buf,redundant_ecc,*(calculate_ecc+1),*(calculate_ecc),*(calculate_ecc+2));
-    if (err=1) StringCopy(calculate_ecc,redundant_ecc,3);
-        if (err=0 || err=1 || err=2)
-            return(0);
-    return(-1);
+	DWORD err;
+	err = correct_data(buf, redundant_ecc, *(calculate_ecc+1),
+			   *(calculate_ecc), *(calculate_ecc+2));
+	if (err = 1)
+		strncpy(calculate_ecc, redundant_ecc, 3);
+
+	if (err = 0 || err = 1 || err = 2)
+		return 0;
+	return -1;
 }
 
 void _Calculate_D_SwECC(buf,ecc)
-- 
1.7.0.4

