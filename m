From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 28 Jul 2018 06:49:48 +0000
Subject: [PATCH net-next] xfrm: Make function xfrmi_get_link_net() static
Message-Id: <1532760588-31129-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Lorenzo Colitti <lorenzo@google.com>, Benedict Wong <benedictwong@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

net/xfrm/xfrm_interface.c:745:12: warning:
 symbol 'xfrmi_get_link_net' was not declared. Should it be static?

Fixes: f203b76d7809 ("xfrm: Add virtual xfrm interfaces")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/xfrm/xfrm_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_interface.c b/net/xfrm/xfrm_interface.c
index 31acc6f..2c0a5c5 100644
--- a/net/xfrm/xfrm_interface.c
+++ b/net/xfrm/xfrm_interface.c
@@ -742,7 +742,7 @@ static int xfrmi_fill_info(struct sk_buff *skb, const struct net_device *dev)
 	return -EMSGSIZE;
 }
 
-struct net *xfrmi_get_link_net(const struct net_device *dev)
+static struct net *xfrmi_get_link_net(const struct net_device *dev)
 {
 	struct xfrm_if *xi = netdev_priv(dev);

