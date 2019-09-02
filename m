From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Sep 2019 14:38:50 +0000
Subject: [PATCH] platform/x86: asus-wmi: Fix condition in charge_threshold_store()
Message-Id: <20190902143850.GA607@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This error handling is reversed so we return early.

Fixes: 84d8e80b0a36 ("platform/x86: asus-wmi: Refactor charge_threshold_store()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 14467748b343..848b23764fc3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2068,7 +2068,7 @@ static ssize_t charge_threshold_store(struct device *dev,
 		return -EINVAL;
 
 	ret = asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	if (rv != 1)
-- 
2.20.1
