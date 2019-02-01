From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2019 08:24:06 +0000
Subject: [PATCH net] ethtool: remove unnecessary check in ethtool_get_regs()
Message-Id: <20190201082406.GA8459@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Yunsheng Lin <linyunsheng@huawei.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Wenwen Wang <wang6495@umn.edu>, Boris Pismenny <borisp@mellanox.com>, Ilya Lesokhin <ilyal@mellanox.com>, Edward Cree <ecree@solarflare.com>, Michal Kubecek <mkubecek@suse.cz>, Yury Norov <ynorov@caviumnetworks.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently changed this function in commit f9fc54d313fa ("ethtool:
check the return value of get_regs_len") such that if "reglen" is zero
we return directly.  That means we can remove this condition as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/core/ethtool.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/net/core/ethtool.c b/net/core/ethtool.c
index 158264f7cfaf..3fe6e9da3579 100644
--- a/net/core/ethtool.c
+++ b/net/core/ethtool.c
@@ -1348,12 +1348,9 @@ static int ethtool_get_regs(struct net_device *dev, char __user *useraddr)
 	if (regs.len > reglen)
 		regs.len = reglen;
 
-	regbuf = NULL;
-	if (reglen) {
-		regbuf = vzalloc(reglen);
-		if (!regbuf)
-			return -ENOMEM;
-	}
+	regbuf = vzalloc(reglen);
+	if (!regbuf)
+		return -ENOMEM;
 
 	ops->get_regs(dev, &regs, regbuf);
 
-- 
2.17.1
