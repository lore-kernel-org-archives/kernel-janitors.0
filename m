From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Mar 2020 11:25:34 +0000
Subject: [PATCH][next] ethtool: fix spelling mistake "exceeeds" -> "exceeds"
Message-Id: <20200313112534.76626-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Kubecek <mkubecek@suse.cz>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in NL_SET_ERR_MSG_ATTR messages.
Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ethtool/channels.c | 2 +-
 net/ethtool/rings.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ethtool/channels.c b/net/ethtool/channels.c
index 8dc5485333a4..389924b65d05 100644
--- a/net/ethtool/channels.c
+++ b/net/ethtool/channels.c
@@ -189,7 +189,7 @@ int ethnl_set_channels(struct sk_buff *skb, struct genl_info *info)
 	if (err_attr) {
 		ret = -EINVAL;
 		NL_SET_ERR_MSG_ATTR(info->extack, err_attr,
-				    "requested channel count exceeeds maximum");
+				    "requested channel count exceeds maximum");
 		goto out_ops;
 	}
 
diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
index c2ebf72be217..5422526f4eef 100644
--- a/net/ethtool/rings.c
+++ b/net/ethtool/rings.c
@@ -181,7 +181,7 @@ int ethnl_set_rings(struct sk_buff *skb, struct genl_info *info)
 	if (err_attr) {
 		ret = -EINVAL;
 		NL_SET_ERR_MSG_ATTR(info->extack, err_attr,
-				    "requested ring size exceeeds maximum");
+				    "requested ring size exceeds maximum");
 		goto out_ops;
 	}
 
-- 
2.25.1
