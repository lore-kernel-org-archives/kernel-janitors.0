From: Colin King <colin.king@canonical.com>
Date: Sat, 09 May 2020 21:41:11 +0000
Subject: [PATCH] net: usb: ax88179_178a: remove redundant assignment to variable ret
Message-Id: <20200509214111.505920-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/usb/ax88179_178a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index b05bb11a02cb..950711448f39 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -860,7 +860,7 @@ static int ax88179_set_eee(struct net_device *net, struct ethtool_eee *edata)
 {
 	struct usbnet *dev = netdev_priv(net);
 	struct ax88179_data *priv = (struct ax88179_data *)dev->data;
-	int ret = -EOPNOTSUPP;
+	int ret;
 
 	priv->eee_enabled = edata->eee_enabled;
 	if (!priv->eee_enabled) {
-- 
2.25.1
