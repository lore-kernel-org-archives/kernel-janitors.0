From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Feb 2018 17:29:21 +0000
Subject: [PATCH] vmxnet3: remove redundant initialization of pointer 'rq'
Message-Id: <20180201172921.22770-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shrikrishna Khare <skhare@vmware.com>, pv-drivers@vmware.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer rq is being initialized but this value is never read, it
is being updated inside a for-loop. Remove the initialization and
move it into the scope of the for-loop.

Cleans up clang warning:
drivers/net/vmxnet3/vmxnet3_drv.c:2763:27: warning: Value stored
to 'rq' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/vmxnet3/vmxnet3_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
index cf95290b160c..8b39c160743d 100644
--- a/drivers/net/vmxnet3/vmxnet3_drv.c
+++ b/drivers/net/vmxnet3/vmxnet3_drv.c
@@ -2760,9 +2760,6 @@ static void
 vmxnet3_adjust_rx_ring_size(struct vmxnet3_adapter *adapter)
 {
 	size_t sz, i, ring0_size, ring1_size, comp_size;
-	struct vmxnet3_rx_queue	*rq = &adapter->rx_queue[0];
-
-
 	if (adapter->netdev->mtu <= VMXNET3_MAX_SKB_BUF_SIZE -
 				    VMXNET3_MAX_ETH_HDR_SIZE) {
 		adapter->skb_buf_size = adapter->netdev->mtu +
@@ -2794,7 +2791,8 @@ vmxnet3_adjust_rx_ring_size(struct vmxnet3_adapter *adapter)
 	comp_size = ring0_size + ring1_size;
 
 	for (i = 0; i < adapter->num_rx_queues; i++) {
-		rq = &adapter->rx_queue[i];
+		struct vmxnet3_rx_queue	*rq = &adapter->rx_queue[i];
+
 		rq->rx_ring[0].size = ring0_size;
 		rq->rx_ring[1].size = ring1_size;
 		rq->comp_ring.size = comp_size;
-- 
2.15.1

