From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:04:13 +0000
Subject: [PATCH net] ethtool: linkinfo: remove an unnecessary NULL check
Message-Id: <20200605110413.GF978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>, Michal Kubecek <mkubecek@suse.cz>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code generates a Smatch warning:

    net/ethtool/linkinfo.c:143 ethnl_set_linkinfo()
    warn: variable dereferenced before check 'info' (see line 119)

Fortunately, the "info" pointer is never NULL so the check can be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/ethtool/linkinfo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ethtool/linkinfo.c b/net/ethtool/linkinfo.c
index 677068deb68c0..5eaf173eaaca5 100644
--- a/net/ethtool/linkinfo.c
+++ b/net/ethtool/linkinfo.c
@@ -140,8 +140,7 @@ int ethnl_set_linkinfo(struct sk_buff *skb, struct genl_info *info)
 
 	ret = __ethtool_get_link_ksettings(dev, &ksettings);
 	if (ret < 0) {
-		if (info)
-			GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
+		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
 		goto out_ops;
 	}
 	lsettings = &ksettings.base;
-- 
2.26.2
