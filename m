From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Sep 2017 11:27:12 +0000
Subject: [PATCH] mfd: stw481x: make three arrays static const, reduces object code size
Message-Id: <20170905112712.15779-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays vcore_val, vpll_val and vaux_val on the
stack, instead make them static const.  Makes the object code smaller
by over 370 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
   6971	   3248	     64	  10283	   282b	drivers/mfd/stw481x.o

After:
   text	   data	    bss	    dec	    hex	filename
   6338	   3504	     64	   9906	   26b2	drivers/mfd/stw481x.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/stw481x.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/stw481x.c b/drivers/mfd/stw481x.c
index ab949eaca6ad..3cc80956260e 100644
--- a/drivers/mfd/stw481x.c
+++ b/drivers/mfd/stw481x.c
@@ -72,10 +72,12 @@ static int stw481x_get_pctl_reg(struct stw481x *stw481x, u8 reg)
 static int stw481x_startup(struct stw481x *stw481x)
 {
 	/* Voltages multiplied by 100 */
-	u8 vcore_val[] = { 100, 105, 110, 115, 120, 122, 124, 126, 128,
-			   130, 132, 134, 136, 138, 140, 145 };
-	u8 vpll_val[] = { 105, 120, 130, 180 };
-	u8 vaux_val[] = { 15, 18, 25, 28 };
+	static const u8 vcore_val[] = {
+		100, 105, 110, 115, 120, 122, 124, 126, 128,
+		130, 132, 134, 136, 138, 140, 145
+	};
+	static const u8 vpll_val[] = { 105, 120, 130, 180 };
+	static const u8 vaux_val[] = { 15, 18, 25, 28 };
 	u8 vcore;
 	u8 vcore_slp;
 	u8 vpll;
-- 
2.14.1

