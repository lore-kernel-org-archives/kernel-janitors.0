From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Aug 2018 10:44:32 +0000
Subject: [PATCH] staging: gasket: apex: remove unused array cm_mappable_regions
Message-Id: <20180809104432.26947-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Springer <rspringer@google.com>, John Joseph <jnjoseph@google.com>, Ben Chan <benchan@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array cm_mappable_regions is defined but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: 'cm_mappable_regions' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/gasket/apex_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gasket/apex_driver.c b/drivers/staging/gasket/apex_driver.c
index c747e9ca4518..6dca3b177863 100644
--- a/drivers/staging/gasket/apex_driver.c
+++ b/drivers/staging/gasket/apex_driver.c
@@ -138,9 +138,6 @@ static const struct gasket_mappable_region mappable_regions[NUM_REGIONS] = {
 	{ 0x48000, 0x1000 },
 };
 
-static const struct gasket_mappable_region cm_mappable_regions[1] = { { 0x0,
-	APEX_CH_MEM_BYTES } };
-
 /* Gasket device interrupts enums must be dense (i.e., no empty slots). */
 enum apex_interrupt {
 	APEX_INTERRUPT_INSTR_QUEUE = 0,
-- 
2.17.1

