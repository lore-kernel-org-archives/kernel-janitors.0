From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2015 15:12:35 +0000
Subject: [patch]  hv: util: checking the wrong variable
Message-Id: <20150529151234.GG10313@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We don't catch this allocation failure because there is a typo and we
check the wrong variable.

Fixes: 14b50f80c32d ('Drivers: hv: util: introduce hv_utils_transport abstraction')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hv/hv_utils_transport.c b/drivers/hv/hv_utils_transport.c
index ea7ba5e..6a9d80a 100644
--- a/drivers/hv/hv_utils_transport.c
+++ b/drivers/hv/hv_utils_transport.c
@@ -186,7 +186,7 @@ int hvutil_transport_send(struct hvutil_transport *hvt, void *msg, int len)
 		return -EINVAL;
 	} else if (hvt->mode = HVUTIL_TRANSPORT_NETLINK) {
 		cn_msg = kzalloc(sizeof(*cn_msg) + len, GFP_ATOMIC);
-		if (!msg)
+		if (!cn_msg)
 			return -ENOMEM;
 		cn_msg->id.idx = hvt->cn_id.idx;
 		cn_msg->id.val = hvt->cn_id.val;
