From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 08:36:35 +0000
Subject: [PATCH 1/3] powercap/drivers/dtpm: Fix a double shift bug
Message-Id: <X/V2k8dwaXJH6VFh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The DTPM_POWER_LIMIT_FLAG is used for test_bit() etc which take a bit
number so it should be bit 0.  But currently it's set to BIT(0) then
that is double shifted equivalent to BIT(BIT(0)).  This doesn't cause a
run time problem because it's done consistently.

Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal power management")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/powercap/dtpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index 0abcc439d728..d49df0569cd4 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -24,7 +24,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 
-#define DTPM_POWER_LIMIT_FLAG BIT(0)
+#define DTPM_POWER_LIMIT_FLAG 0
 
 static const char *constraint_name[] = {
 	"Instantaneous",
-- 
2.29.2
