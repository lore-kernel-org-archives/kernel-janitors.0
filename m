From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 21 Jan 2019 09:34:53 +0000
Subject: [PATCH net-next] devlink: Add missing check of nlmsg_put
Message-Id: <1548063293-17855-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

nlmsg_put may fail, this fix add a check of its return value.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/core/devlink.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 60248a5..059575c 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4086,6 +4086,9 @@ void devlink_health_buffer_nest_cancel(struct devlink_health_buffer *buffer)
 		return -ENOMEM;
 	nlh = nlmsg_put(skb, info->snd_portid, info->snd_seq,
 			NLMSG_DONE, 0, flags | NLM_F_MULTI);
+	if (!nlh)
+		goto nla_put_failure;
+
 	err = genlmsg_reply(skb, info);
 	if (err)
 		return err;
