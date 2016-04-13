From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Apr 2016 06:45:11 +0000
Subject: [patch] ARM: qcom: silence an uninitialized variable warning
Message-Id: <20160413064511.GG8092@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Tim Bird <tim.bird@sonymobile.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's harmless but, if "enable" isn't set, then we pass uninitialized
values to qcom_coincell_chgr_config().  The values aren't used, but
let's silence the warning anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
index 7b4a2da..829a61d 100644
--- a/drivers/misc/qcom-coincell.c
+++ b/drivers/misc/qcom-coincell.c
@@ -94,7 +94,8 @@ static int qcom_coincell_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
 	struct qcom_coincell chgr;
-	u32 rset, vset;
+	u32 rset = 0;
+	u32 vset = 0;
 	bool enable;
 	int rc;
 
