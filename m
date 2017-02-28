From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Feb 2017 12:02:15 +0000
Subject: [patch] net/mlx4: && vs & typo
Message-Id: <20170228120215.GA27947@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Eugenia Emantayev <eugenia-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Bitwise & was obviously intended here.

Fixes: 745d8ae4622c ("net/mlx4: Spoofcheck and zero MAC can't coexist")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to net.git.

diff --git a/include/linux/mlx4/driver.h b/include/linux/mlx4/driver.h
index e965e5090d96..a858bcb6220b 100644
--- a/include/linux/mlx4/driver.h
+++ b/include/linux/mlx4/driver.h
@@ -109,7 +109,7 @@ static inline void mlx4_u64_to_mac(u8 *addr, u64 mac)
 	int i;
 
 	for (i = ETH_ALEN; i > 0; i--) {
-		addr[i - 1] = mac && 0xFF;
+		addr[i - 1] = mac & 0xFF;
 		mac >>= 8;
 	}
 }
