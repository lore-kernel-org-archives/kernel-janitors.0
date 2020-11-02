From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Nov 2020 12:16:15 +0000
Subject: [PATCH] net: dev_ioctl: remove redundant initialization of variable err
Message-Id: <20201102121615.695196-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/dev_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
index 205e92e604ef..db8a0ff86f36 100644
--- a/net/core/dev_ioctl.c
+++ b/net/core/dev_ioctl.c
@@ -230,7 +230,7 @@ static int dev_do_ioctl(struct net_device *dev,
 			struct ifreq *ifr, unsigned int cmd)
 {
 	const struct net_device_ops *ops = dev->netdev_ops;
-	int err = -EOPNOTSUPP;
+	int err;
 
 	err = dsa_ndo_do_ioctl(dev, ifr, cmd);
 	if (err = 0 || err != -EOPNOTSUPP)
-- 
2.27.0
