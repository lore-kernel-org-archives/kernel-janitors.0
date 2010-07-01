From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 01 Jul 2010 11:23:08 +0000
Subject: [PATCH 15/16] staging/wlags49_h2: use ARRAY_SIZE
Message-Id: <1277983390-30164-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Henk de Groot <pe1dnn@amsat.org>, Joe Perches <joe@perches.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/wlags49_h2/hcf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlags49_h2/hcf.c b/drivers/staging/wlags49_h2/hcf.c
index 390628c..c4fe0ec 100644
--- a/drivers/staging/wlags49_h2/hcf.c
+++ b/drivers/staging/wlags49_h2/hcf.c
@@ -502,7 +502,7 @@ HCF_STATIC hcf_16* BASED xxxx[ ] = {
 #endif // MSF_COMPONENT_ID
 	NULL									//endsentinel
   };
-#define xxxx_PRI_IDENTITY_OFFSET	(sizeof(xxxx)/sizeof(xxxx[0]) - 3)
+#define xxxx_PRI_IDENTITY_OFFSET	(ARRAY_SIZE(xxxx) - 3)
 
 #endif // MSF_COMPONENT_ID / HCF_EXT_MB
 
-- 
1.7.0.4

