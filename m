From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 14:54:49 +0000
Subject: [patch] ixgbe: remove duplicate IXGBE_MAX_L2A_QUEUES define
Message-Id: <20140609145449.GA9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The IXGBE_MAX_L2A_QUEUES define is cut and pasted twice so we can delete
the second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe.h b/drivers/net/ethernet/intel/ixgbe/ixgbe.h
index ac9f214..bfb2c23 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe.h
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe.h
@@ -307,7 +307,6 @@ enum ixgbe_ring_f_enum {
 #define MAX_RX_QUEUES (IXGBE_MAX_FDIR_INDICES + 1)
 #define MAX_TX_QUEUES (IXGBE_MAX_FDIR_INDICES + 1)
 #define IXGBE_MAX_L2A_QUEUES 4
-#define IXGBE_MAX_L2A_QUEUES 4
 #define IXGBE_BAD_L2A_QUEUE 3
 #define IXGBE_MAX_MACVLANS	31
 #define IXGBE_MAX_DCBMACVLANS	8
