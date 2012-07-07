From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 07 Jul 2012 18:44:49 +0000
Subject: [PATCH] CSR: fix function declaration warnings
Message-Id: <1341686689-21721-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sparse is warning about non-ANSI function declaration.
Add void to the parameterless function.

drivers/staging/csr/csr_wifi_hip_chiphelper.c:633:31: warning:
	non-ANSI function declaration of function 'ChipHelper_Null'

I also fixed this checkpatch error:
ERROR: "foo* bar" should be "foo *bar"

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/csr/csr_wifi_hip_chiphelper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/csr/csr_wifi_hip_chiphelper.c b/drivers/staging/csr/csr_wifi_hip_chiphelper.c
index 0e2477f..5e9851c 100644
--- a/drivers/staging/csr/csr_wifi_hip_chiphelper.c
+++ b/drivers/staging/csr/csr_wifi_hip_chiphelper.c
@@ -630,7 +630,7 @@ ChipDescript* ChipHelper_GetVersionUniFi(CsrUint16 ver)
 }
 
 
-ChipDescript* ChipHelper_Null()
+ChipDescript *ChipHelper_Null(void)
 {
     return &chip_device_desc_null;
 }
-- 
1.7.10.4

