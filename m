From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Apr 2020 13:41:26 +0000
Subject: [PATCH] net-sysfs: remove redundant assignment to variable ret
Message-Id: <20200409134126.417215-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/net-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index cf0215734ceb..4773ad6ec111 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -80,7 +80,7 @@ static ssize_t netdev_store(struct device *dev, struct device_attribute *attr,
 	struct net_device *netdev = to_net_dev(dev);
 	struct net *net = dev_net(netdev);
 	unsigned long new;
-	int ret = -EINVAL;
+	int ret;
 
 	if (!ns_capable(net->user_ns, CAP_NET_ADMIN))
 		return -EPERM;
-- 
2.25.1
