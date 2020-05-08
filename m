From: Colin King <colin.king@canonical.com>
Date: Fri, 08 May 2020 22:33:21 +0000
Subject: [PATCH] net/atheros: remove redundant assignment to variable size
Message-Id: <20200508223321.483485-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable size is being assigned with a value that is never read,
the assignment is redundant and cab be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/atheros/atlx/atl1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 271e7034fa70..b35fcfcd692d 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -1042,7 +1042,7 @@ static s32 atl1_setup_ring_resources(struct atl1_adapter *adapter)
 	 * each ring/block may need up to 8 bytes for alignment, hence the
 	 * additional 40 bytes tacked onto the end.
 	 */
-	ring_header->size = size +	ring_header->size  		sizeof(struct tx_packet_desc) * tpd_ring->count
 		+ sizeof(struct rx_free_desc) * rfd_ring->count
 		+ sizeof(struct rx_return_desc) * rrd_ring->count
-- 
2.25.1
