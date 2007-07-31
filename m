From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:36:57 +0000
Subject: [PATCH 22] drivers/net/e1000new/ethtool.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311936.57886.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, e1000-devel@lists.sourceforge.net

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/net/e1000new/ethtool.c | 58607 -> 58527 (-80 bytes)
 drivers/net/e1000new/ethtool.o | 197636 -> 197312 (-324 bytes)

 drivers/net/e1000new/ethtool.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/net/e1000new/ethtool.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/net/e1000new/ethtool.c	2007-07-30 00:31:08.000000000 +0200
@@ -1031,12 +1031,11 @@ static int e1000_setup_desc_rings(struct
 		tx_ring->count = E1000_DEFAULT_TXD;

 	size = tx_ring->count * sizeof(struct e1000_buffer);
-	tx_ring->buffer_info = kmalloc(size, GFP_KERNEL);
+	tx_ring->buffer_info = kzalloc(size, GFP_KERNEL);
 	if (!tx_ring->buffer_info) {
 		ret_val = 1;
 		goto err_nomem;
 	}
-	memset(tx_ring->buffer_info, 0, size);

 	tx_ring->size = tx_ring->count * sizeof(struct e1000_tx_desc);
 	tx_ring->size = ALIGN(tx_ring->size, 4096);
@@ -1092,12 +1091,11 @@ static int e1000_setup_desc_rings(struct
 		rx_ring->count = E1000_DEFAULT_RXD;

 	size = rx_ring->count * sizeof(struct e1000_buffer);
-	rx_ring->buffer_info = kmalloc(size, GFP_KERNEL);
+	rx_ring->buffer_info = kzalloc(size, GFP_KERNEL);
 	if (!rx_ring->buffer_info) {
 		ret_val = 4;
 		goto err_nomem;
 	}
-	memset(rx_ring->buffer_info, 0, size);

 	rx_ring->size = rx_ring->count * sizeof(struct e1000_rx_desc);
 	rx_ring->desc = pci_alloc_consistent(pdev, rx_ring->size,
