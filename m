From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Oct 2020 08:01:27 +0000
Subject: [PATCH 2/2 net] devlink: Unlock on error in dumpit()
Message-Id: <20201026080127.GB1628785@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20201026080059.GA1628785@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@nvidia.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to unlock before returning.

Fixes: 544e7c33ec2f ("net: devlink: Add support for port regions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/core/devlink.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 039f7bd8bf28..8b0e1c318e8d 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4919,8 +4919,10 @@ static int devlink_nl_cmd_region_read_dumpit(struct sk_buff *skb,
 		index = nla_get_u32(info->attrs[DEVLINK_ATTR_PORT_INDEX]);
 
 		port = devlink_port_get_by_index(devlink, index);
-		if (!port)
-			return -ENODEV;
+		if (!port) {
+			err = -ENODEV;
+			goto out_unlock;
+		}
 	}
 
 	region_name = nla_data(attrs[DEVLINK_ATTR_REGION_NAME]);
-- 
2.28.0
