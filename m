From: Colin King <colin.king@canonical.com>
Date: Sun, 11 Mar 2018 16:55:47 +0000
Subject: [PATCH][next] lan743x: make functions lan743x_csr_read and lan743x_csr_read static
Message-Id: <20180311165547.27500-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions lan743x_csr_read and lan743x_csr_read are local to the source
and do not need to be in global scope, so make them static.

Cleans up sparse warning:
drivers/net/ethernet/microchip/lan743x_main.c:56:5: warning: symbol
lan743x_csr_read' was not declared. Should it be static?
drivers/net/ethernet/microchip/lan743x_main.c:61:6: warning: symbol
'lan743x_csr_write' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 73ce3ee6a520..dd947e4dd3ce 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -53,12 +53,13 @@ static int lan743x_pci_init(struct lan743x_adapter *adapter,
 	return ret;
 }
 
-u32 lan743x_csr_read(struct lan743x_adapter *adapter, int offset)
+static u32 lan743x_csr_read(struct lan743x_adapter *adapter, int offset)
 {
 	return ioread32(&adapter->csr.csr_address[offset]);
 }
 
-void lan743x_csr_write(struct lan743x_adapter *adapter, int offset, u32 data)
+static void lan743x_csr_write(struct lan743x_adapter *adapter, int offset,
+			      u32 data)
 {
 	iowrite32(data, &adapter->csr.csr_address[offset]);
 }
-- 
2.15.1

