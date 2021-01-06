From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 09:03:08 +0000
Subject: [PATCH 3/3] powercap/drivers/dtpm: Fix an IS_ERR() vs NULL check
Message-Id: <X/V8zHPwlGiSxq1M@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <X/V2k8dwaXJH6VFh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

The powercap_register_control_type() function never returns NULL, it
returns error pointers on error so update this check.

Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal power management")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/powercap/dtpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index 470a1182b868..5a51cd34a7e8 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -467,9 +467,9 @@ static int __init dtpm_init(void)
 	struct dtpm_descr **dtpm_descr;
 
 	pct = powercap_register_control_type(NULL, "dtpm", NULL);
-	if (!pct) {
+	if (IS_ERR(pct)) {
 		pr_err("Failed to register control type\n");
-		return -EINVAL;
+		return PTR_ERR(pct);
 	}
 
 	for_each_dtpm_table(dtpm_descr)
-- 
2.29.2
