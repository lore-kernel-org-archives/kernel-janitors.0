From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:42:36 +0000
Subject: [PATCH] ethtool: potential NULL dereference in strset_prepare_data()
Message-Id: <20200108054236.ult5qxiiwpw2wamk@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Michal Kubecek <mkubecek@suse.cz>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that the NULL checking isn't done consistently:

    net/ethtool/strset.c:253 strset_prepare_data()
    error: we previously assumed 'dev' could be null (see line 233)

It looks like there is a missing return on this path.

Fixes: 71921690f974 ("ethtool: provide string sets with STRSET_GET request")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/ethtool/strset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ethtool/strset.c b/net/ethtool/strset.c
index 9f2243329015..82a059c13c1c 100644
--- a/net/ethtool/strset.c
+++ b/net/ethtool/strset.c
@@ -239,6 +239,7 @@ static int strset_prepare_data(const struct ethnl_req_info *req_base,
 				return -EINVAL;
 			}
 		}
+		return 0;
 	}
 
 	ret = ethnl_ops_begin(dev);
-- 
2.11.0
