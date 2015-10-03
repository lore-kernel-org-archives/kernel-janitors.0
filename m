From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 Oct 2015 19:05:24 +0000
Subject: [patch - Nicholas's tree] netconsole: Missing unlock on error path
Message-Id: <20151003190524.GA766@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nicholas Bellinger <nab@linux-iscsi.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We added new locking to this function but we missed one error path which
needs an unlock.

Fixes: cdacad4993f4 ('netconsole: use per-attribute show and store methods')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is going through Nicholas Bellinger's tree not net-next.

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 8783169..06ee639 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -535,7 +535,7 @@ static ssize_t remote_ip_store(struct config_item *item, const char *buf,
 		if (in6_pton(buf, count, nt->np.remote_ip.in6.s6_addr, -1, &end) > 0) {
 			if (*end && *end != '\n') {
 				pr_err("invalid IPv6 address at: <%c>\n", *end);
-				return -EINVAL;
+				goto out_unlock;
 			}
 			nt->np.ipv6 = true;
 		} else
