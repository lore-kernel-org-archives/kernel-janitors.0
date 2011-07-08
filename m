From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:27:24 +0000
Subject: [patch] dcbnl: unlock on an error path in dcbnl_cee_fill()
Message-Id: <20110708072724.GW18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shmulik Ravid <shmulikr@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, John Fastabend <john.r.fastabend@intel.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

We need to release "dcb_lock" which we took on the previous line.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index 6a015f2..3cb56af 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -1409,7 +1409,7 @@ static int dcbnl_cee_fill(struct sk_buff *skb, struct net_device *netdev)
 	spin_lock(&dcb_lock);
 	app = nla_nest_start(skb, DCB_ATTR_CEE_APP_TABLE);
 	if (!app)
-		goto nla_put_failure;
+		goto dcb_unlock;
 
 	list_for_each_entry(itr, &dcb_app_list, list) {
 		if (strncmp(itr->name, netdev->name, IFNAMSIZ) = 0) {
