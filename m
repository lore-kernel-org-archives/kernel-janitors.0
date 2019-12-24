From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 24 Dec 2019 11:58:12 +0000
Subject: [PATCH net-next v2] net: dsa: qca: ar9331: drop pointless static qualifier in ar9331_sw_mbus_init
Message-Id: <20191224115812.166927-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191224112515.GE3395@lunn.ch>
In-Reply-To: <20191224112515.GE3395@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, linux@rempel-privat.de, maowenan@huawei.com, marek.behun@nic.cz
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to set variable 'mbus' static
since new value always be assigned before use it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change subject and description.
 drivers/net/dsa/qca/ar9331.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/qca/ar9331.c b/drivers/net/dsa/qca/ar9331.c
index 0d1a7cd85fe8..da3bece75e21 100644
--- a/drivers/net/dsa/qca/ar9331.c
+++ b/drivers/net/dsa/qca/ar9331.c
@@ -266,7 +266,7 @@ static int ar9331_sw_mbus_read(struct mii_bus *mbus, int port, int regnum)
 static int ar9331_sw_mbus_init(struct ar9331_sw_priv *priv)
 {
 	struct device *dev = priv->dev;
-	static struct mii_bus *mbus;
+	struct mii_bus *mbus;
 	struct device_node *np, *mnp;
 	int ret;
 
-- 
2.20.1
