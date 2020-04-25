From: Colin King <colin.king@canonical.com>
Date: Sat, 25 Apr 2020 11:28:14 +0000
Subject: [PATCH] net: rtnetlink: remove redundant assignment to variable err
Message-Id: <20200425112814.137857-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/core/rtnetlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index d6f4f4a9e8ba..2269199c5891 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -3997,8 +3997,8 @@ static int rtnl_fdb_del(struct sk_buff *skb, struct nlmsghdr *nlh,
 	struct ndmsg *ndm;
 	struct nlattr *tb[NDA_MAX+1];
 	struct net_device *dev;
-	int err = -EINVAL;
 	__u8 *addr;
+	int err;
 	u16 vid;
 
 	if (!netlink_capable(skb, CAP_NET_ADMIN))
-- 
2.25.1
