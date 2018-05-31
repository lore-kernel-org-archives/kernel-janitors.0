From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 01:58:12 +0000
Subject: [PATCH net-next] hv_netvsc: fix error return code in netvsc_probe()
Message-Id: <1527732283-145530-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Sridhar Samudrala <sridhar.samudrala@intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@linuxdriverproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the failover register fail
error handling case instead of 0, as done elsewhere in this function.

Fixes: 1ff78076d8dd ("netvsc: refactor notifier/event handling code to use the failover framework")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/hyperv/netvsc_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index ebe9642..bef4d55 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -2031,8 +2031,10 @@ static int netvsc_probe(struct hv_device *dev,
 	}
 
 	net_device_ctx->failover = failover_register(net, &netvsc_failover_ops);
-	if (IS_ERR(net_device_ctx->failover))
+	if (IS_ERR(net_device_ctx->failover)) {
+		ret = PTR_ERR(net_device_ctx->failover);
 		goto err_failover;
+	}
 
 	return ret;

