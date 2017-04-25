From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 12:45:04 +0000
Subject: [PATCH 1/2] HSI: Use kcalloc() in hsi_register_board_info()
Message-Id: <7c7f7b19-d3f3-6653-6830-5b00660fa2b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
In-Reply-To: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Carlos Chinea <carlos.chinea@nokia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 13:56:08 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/hsi_boardinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/hsi_boardinfo.c b/drivers/hsi/hsi_boardinfo.c
index e56bc6da5f98..e381cb4c962e 100644
--- a/drivers/hsi/hsi_boardinfo.c
+++ b/drivers/hsi/hsi_boardinfo.c
@@ -49,7 +49,7 @@ int __init hsi_register_board_info(struct hsi_board_info const *info,
 {
 	struct hsi_cl_info *cl_info;
 
-	cl_info = kzalloc(sizeof(*cl_info) * len, GFP_KERNEL);
+	cl_info = kcalloc(len, sizeof(*cl_info), GFP_KERNEL);
 	if (!cl_info)
 		return -ENOMEM;
 
-- 
2.12.2

