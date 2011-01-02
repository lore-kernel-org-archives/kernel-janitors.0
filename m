From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 02 Jan 2011 21:01:35 +0000
Subject: [PATCH 2/3] staging: keucr: Use memcpy() instead custom StringCopy() and some style cleanups
Message-Id: <1294002097-3058-3-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/keucr/smilecc.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/keucr/smilecc.c b/drivers/staging/keucr/smilecc.c
index daf322a..d915c04 100644
--- a/drivers/staging/keucr/smilecc.c
+++ b/drivers/staging/keucr/smilecc.c
@@ -182,13 +182,17 @@ BYTE *buf;
 BYTE *redundant_ecc;
 BYTE *calculate_ecc;
 {
-    DWORD err;
+	DWORD err;
 
-    err=correct_data(buf,redundant_ecc,*(calculate_ecc+1),*(calculate_ecc),*(calculate_ecc+2));
-    if (err=1) StringCopy(calculate_ecc,redundant_ecc,3);
-        if (err=0 || err=1 || err=2)
-            return(0);
-    return(-1);
+	err = correct_data(buf, redundant_ecc, *(calculate_ecc + 1),
+			   *(calculate_ecc), *(calculate_ecc + 2));
+	if (err = 1)
+		memcpy(calculate_ecc, redundant_ecc, 3);
+
+	if (err = 0 || err = 2)
+		return 0;
+
+	return -1;
 }
 
 void _Calculate_D_SwECC(buf,ecc)
-- 
1.7.0.4

