From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 19:11:50 +0000
Subject: [PATCH] net: neterion: remove redundant assignment to variable tmp64
Message-Id: <20200410191150.75588-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jdmason@kudzu.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable tmp64 is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/neterion/s2io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/neterion/s2io.c
index 0ec6b8e8b549..67e62603fe3b 100644
--- a/drivers/net/ethernet/neterion/s2io.c
+++ b/drivers/net/ethernet/neterion/s2io.c
@@ -5155,7 +5155,7 @@ static int do_s2io_delete_unicast_mc(struct s2io_nic *sp, u64 addr)
 /* read mac entries from CAM */
 static u64 do_s2io_read_unicast_mc(struct s2io_nic *sp, int offset)
 {
-	u64 tmp64 = 0xffffffffffff0000ULL, val64;
+	u64 tmp64, val64;
 	struct XENA_dev_config __iomem *bar0 = sp->bar0;
 
 	/* read mac addr */
-- 
2.25.1
