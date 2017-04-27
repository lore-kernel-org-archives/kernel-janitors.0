From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 09:28:45 +0000
Subject: [PATCH 1/4] hwmon-nct6683: Use devm_kcalloc() in nct6683_create_attr_group()
Message-Id: <719f2298-cd74-8769-b52b-1be9568b3851@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
In-Reply-To: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hwmon@vger.kernel.org, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 10:10:36 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwmon/nct6683.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 8b0bc4fc06e8..dd14a98cc6dd 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -426,13 +426,12 @@ nct6683_create_attr_group(struct device *dev,
 	if (group = NULL)
 		return ERR_PTR(-ENOMEM);
 
-	attrs = devm_kzalloc(dev, sizeof(*attrs) * (repeat * count + 1),
+	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
 			     GFP_KERNEL);
 	if (attrs = NULL)
 		return ERR_PTR(-ENOMEM);
 
-	su = devm_kzalloc(dev, sizeof(*su) * repeat * count,
-			  GFP_KERNEL);
+	su = devm_kcalloc(dev, repeat * count, sizeof(*su), GFP_KERNEL);
 	if (su = NULL)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.12.2

