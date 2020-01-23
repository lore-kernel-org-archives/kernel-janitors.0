From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 09:27:30 +0000
Subject: [PATCH][V2] net/rose: fix spelling mistake "to" -> "too"
Message-Id: <20200123092730.10909-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a printk message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: split the patch, the V1 included another fix.
---
 net/rose/af_rose.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 46b8ff24020d..1e8eeb044b07 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1475,7 +1475,7 @@ static int __init rose_proto_init(void)
 	int rc;
 
 	if (rose_ndevs > 0x7FFFFFFF/sizeof(struct net_device *)) {
-		printk(KERN_ERR "ROSE: rose_proto_init - rose_ndevs parameter to large\n");
+		printk(KERN_ERR "ROSE: rose_proto_init - rose_ndevs parameter too large\n");
 		rc = -EINVAL;
 		goto out;
 	}
-- 
2.24.0
