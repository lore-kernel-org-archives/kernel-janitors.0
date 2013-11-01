From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:18:44 +0000
Subject: [patch -next] bonding: bond_get_size() returns wrong size
Message-Id: <20131101101844.GA29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Vosburgh <fubar@us.ibm.com>
Cc: Veaceslav Falico <vfalico@redhat.com>, Andy Gospodarek <andy@greyhouse.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>

There is an extra semi-colon so bond_get_size() doesn't return the
correct value.

Fixes: ec76aa49855f ('bonding: add Netlink support active_slave option')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/bonding/bond_netlink.c b/drivers/net/bonding/bond_netlink.c
index 7661261..40e7b1c 100644
--- a/drivers/net/bonding/bond_netlink.c
+++ b/drivers/net/bonding/bond_netlink.c
@@ -82,8 +82,8 @@ static int bond_newlink(struct net *src_net, struct net_device *bond_dev,
 
 static size_t bond_get_size(const struct net_device *bond_dev)
 {
-	return nla_total_size(sizeof(u8));	/* IFLA_BOND_MODE */
-		+ nla_total_size(sizeof(u32));	/* IFLA_BOND_ACTIVE_SLAVE */
+	return nla_total_size(sizeof(u8)) +	/* IFLA_BOND_MODE */
+		nla_total_size(sizeof(u32));	/* IFLA_BOND_ACTIVE_SLAVE */
 }
 
 static int bond_fill_info(struct sk_buff *skb,
