From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Nov 2020 10:08:50 +0000
Subject: [PATCH] soc: aspeed: Fix a reference leak in aspeed_socinfo_init()
Message-Id: <20201113100850.GA168908@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Tom Rix <trix@redhat.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to call of_node_put(np) before returning if of_iomap() fails.

Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/aspeed-socinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/aspeed-socinfo.c
index 20a1d4aeb051..773930e0cb10 100644
--- a/drivers/soc/aspeed/aspeed-socinfo.c
+++ b/drivers/soc/aspeed/aspeed-socinfo.c
@@ -74,8 +74,10 @@ static int __init aspeed_socinfo_init(void)
 	}
 
 	reg = of_iomap(np, 0);
-	if (!reg)
+	if (!reg) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 	siliconid = readl(reg);
 	iounmap(reg);
 
-- 
2.28.0
