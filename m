From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jul 2020 14:07:47 +0000
Subject: [PATCH][next] thermal: core: remove redundant initialization of variable ret
Message-Id: <20200706140747.489075-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/thermal_netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_netlink.c b/drivers/thermal/thermal_netlink.c
index d3c48bbcd269..cb56950f59d2 100644
--- a/drivers/thermal/thermal_netlink.c
+++ b/drivers/thermal/thermal_netlink.c
@@ -548,7 +548,7 @@ static int thermal_genl_cmd_dumpit(struct sk_buff *skb,
 	struct param p = { .msg = skb };
 	const struct genl_dumpit_info *info = genl_dumpit_info(cb);
 	int cmd = info->ops->cmd;
-	int ret = -EMSGSIZE;
+	int ret;
 	void *hdr;
 
 	hdr = genlmsg_put(skb, 0, 0, &thermal_gnl_family, 0, cmd);
-- 
2.27.0
