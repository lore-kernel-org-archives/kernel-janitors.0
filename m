From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:09:01 +0000
Subject: [patch] net: sxgbe: remove duplicate SXGBE_CORE_L34_ADDCTL_REG define
Message-Id: <20140609150901.GC9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Byungho An <bh74.an@samsung.com>
Cc: Girish K S <ks.giri@samsung.com>, Vipul Pandya <vipul.pandya@samsung.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The SXGBE_CORE_L34_ADDCTL_REG define is cut and pasted twice so we can
delete the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_reg.h b/drivers/net/ethernet/samsung/sxgbe/sxgbe_reg.h
index 56f8bf5..81437d9 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_reg.h
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_reg.h
@@ -188,7 +188,6 @@
 
 /* L3/L4 function registers */
 #define SXGBE_CORE_L34_ADDCTL_REG	0x0C00
-#define SXGBE_CORE_L34_ADDCTL_REG	0x0C00
 #define SXGBE_CORE_L34_DATA_REG		0x0C04
 
 /* ARP registers */
