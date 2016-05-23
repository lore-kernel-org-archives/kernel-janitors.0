From: Daniel van Gerpen <daniel@vangerpen.de>
Date: Mon, 23 May 2016 13:19:38 +0000
Subject: [PATCH 2/2] s390: use canonical include guard style
Message-Id: <20160523151938.661e2bfb@newton>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>
---
 arch/s390/include/asm/fcx.h | 2 +-
 drivers/s390/cio/chp.h      | 2 +-
 drivers/s390/cio/idset.h    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/fcx.h b/arch/s390/include/asm/fcx.h
index 7ecb92b..04cb4b4 100644
--- a/arch/s390/include/asm/fcx.h
+++ b/arch/s390/include/asm/fcx.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef _ASM_S390_FCX_H
-#define _ASM_S390_FCX_H _ASM_S390_FCX_H
+#define _ASM_S390_FCX_H
 
 #include <linux/types.h>
 
diff --git a/drivers/s390/cio/chp.h b/drivers/s390/cio/chp.h
index af02322..bb5a682 100644
--- a/drivers/s390/cio/chp.h
+++ b/drivers/s390/cio/chp.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef S390_CHP_H
-#define S390_CHP_H S390_CHP_H
+#define S390_CHP_H
 
 #include <linux/types.h>
 #include <linux/device.h>
diff --git a/drivers/s390/cio/idset.h b/drivers/s390/cio/idset.h
index 22b5810..89a7877 100644
--- a/drivers/s390/cio/idset.h
+++ b/drivers/s390/cio/idset.h
@@ -4,7 +4,7 @@
  */
 
 #ifndef S390_IDSET_H
-#define S390_IDSET_H S390_IDSET_H
+#define S390_IDSET_H
 
 #include <asm/schid.h>
 
-- 
1.9.1


