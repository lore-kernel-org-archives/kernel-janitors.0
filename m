From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 21 Jan 2019 08:21:21 +0000
Subject: [PATCH net-next] devlink: Fix error return code in devlink_health_buffer_prepare_skb()
Message-Id: <1548058881-147159-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Eran Ben Elisha <eranbe@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code -EMSGSIZE from the error handling
case, otherwise 0 or uninitialized value may be returned.

Fixes: cb5ccfbe73b3 ("devlink: Add health buffer support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/core/devlink.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/devlink.c b/net/core/devlink.c
index 60248a5..0d4c774 100644
--- a/net/core/devlink.c
+++ b/net/core/devlink.c
@@ -4008,8 +4008,10 @@ void devlink_health_buffer_nest_cancel(struct devlink_health_buffer *buffer)
 		case DEVLINK_ATTR_HEALTH_BUFFER_OBJECT_VALUE:
 		case DEVLINK_ATTR_HEALTH_BUFFER_OBJECT_VALUE_ARRAY:
 			buffer_nlattr[i] = nla_nest_start(skb, desc->attrtype);
-			if (!buffer_nlattr[i])
+			if (!buffer_nlattr[i]) {
+				err = -EMSGSIZE;
 				goto nla_put_failure;
+			}
 			i++;
 			break;
 		case DEVLINK_ATTR_HEALTH_BUFFER_OBJECT_VALUE_DATA:
