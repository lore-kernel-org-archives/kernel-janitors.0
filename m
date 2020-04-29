From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 07:58:20 +0000
Subject: [PATCH -next] ptp: ptp_ines: convert to devm_platform_ioremap_resource
Message-Id: <20200429075820.103452-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Use the helper function that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/ptp/ptp_ines.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/ptp/ptp_ines.c b/drivers/ptp/ptp_ines.c
index 52d77db39829..7711651ff19e 100644
--- a/drivers/ptp/ptp_ines.c
+++ b/drivers/ptp/ptp_ines.c
@@ -783,16 +783,10 @@ static struct mii_timestamping_ctrl ines_ctrl = {
 static int ines_ptp_ctrl_probe(struct platform_device *pld)
 {
 	struct ines_clock *clock;
-	struct resource *res;
 	void __iomem *addr;
 	int err = 0;
 
-	res = platform_get_resource(pld, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pld->dev, "missing memory resource\n");
-		return -EINVAL;
-	}
-	addr = devm_ioremap_resource(&pld->dev, res);
+	addr = devm_platform_ioremap_resource(pld, 0);
 	if (IS_ERR(addr)) {
 		err = PTR_ERR(addr);
 		goto out;
