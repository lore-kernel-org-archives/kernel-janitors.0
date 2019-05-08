From: Colin King <colin.king@canonical.com>
Date: Wed, 08 May 2019 22:02:08 +0000
Subject: [PATCH] nbd: add null check on dev_list to avoid potential null pointer dereference
Message-Id: <20190508220208.26146-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to nla_nest_start_noflag can return a null pointer and currently
this is not being checked and this can lead to a null pointer dereference
when the null pointer dev_list is passed to function nla_nest_end. Fix
this by adding in a null pointer check.

Addresses-Coverity: ("Dereference null return value")
Fixes: 47d902b90a32 ("nbd: add a status netlink command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/nbd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 053958a8a2ba..ed263963e778 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2117,6 +2117,10 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		nlmsg_free(reply);
+		goto out;
+	}
 	if (index = -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.20.1
