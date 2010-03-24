From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Mar 2010 11:56:03 +0000
Subject: [patch] wimax: remove unneeded variable
Message-Id: <20100324115603.GD21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alexey Dobriyan <adobriyan@gmail.com>, Jiri Kosina <jkosina@suse.cz>, kernel-janitors@vger.kernel.org

We never actually use "dev" so I removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/wimax/op-reset.c b/net/wimax/op-reset.c
index 4dc82a5..68bedf3 100644
--- a/net/wimax/op-reset.c
+++ b/net/wimax/op-reset.c
@@ -110,7 +110,6 @@ int wimax_gnl_doit_reset(struct sk_buff *skb, struct genl_info *info)
 {
 	int result, ifindex;
 	struct wimax_dev *wimax_dev;
-	struct device *dev;
 
 	d_fnstart(3, NULL, "(skb %p info %p)\n", skb, info);
 	result = -ENODEV;
@@ -123,7 +122,6 @@ int wimax_gnl_doit_reset(struct sk_buff *skb, struct genl_info *info)
 	wimax_dev = wimax_dev_get_by_genl_info(info, ifindex);
 	if (wimax_dev = NULL)
 		goto error_no_wimax_dev;
-	dev = wimax_dev_to_dev(wimax_dev);
 	/* Execute the operation and send the result back to user space */
 	result = wimax_reset(wimax_dev);
 	dev_put(wimax_dev->net_dev);
diff --git a/net/wimax/op-state-get.c b/net/wimax/op-state-get.c
index 11ad335..aff8776 100644
--- a/net/wimax/op-state-get.c
+++ b/net/wimax/op-state-get.c
@@ -53,7 +53,6 @@ int wimax_gnl_doit_state_get(struct sk_buff *skb, struct genl_info *info)
 {
 	int result, ifindex;
 	struct wimax_dev *wimax_dev;
-	struct device *dev;
 
 	d_fnstart(3, NULL, "(skb %p info %p)\n", skb, info);
 	result = -ENODEV;
@@ -66,7 +65,6 @@ int wimax_gnl_doit_state_get(struct sk_buff *skb, struct genl_info *info)
 	wimax_dev = wimax_dev_get_by_genl_info(info, ifindex);
 	if (wimax_dev = NULL)
 		goto error_no_wimax_dev;
-	dev = wimax_dev_to_dev(wimax_dev);
 	/* Execute the operation and send the result back to user space */
 	result = wimax_state_get(wimax_dev);
 	dev_put(wimax_dev->net_dev);
