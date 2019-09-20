From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 20 Sep 2019 08:44:05 +0000
Subject: [PATCH net] net: ena: Add dependency for ENA_ETHERNET
Message-Id: <20190920084405.140750-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netanel@amazon.com, saeedb@amazon.com, zorik@amazon.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If CONFIG_ENA_ETHERNET=y and CONFIG_DIMLIB=n,
below erros can be found:
drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_dim_work':
ena_netdev.c:(.text+0x21cc): undefined reference to `net_dim_get_rx_moderation'
ena_netdev.c:(.text+0x21cc): relocation truncated to
fit: R_AARCH64_CALL26 against undefined symbol `net_dim_get_rx_moderation'
drivers/net/ethernet/amazon/ena/ena_netdev.o: In function `ena_io_poll':
ena_netdev.c:(.text+0x7bd4): undefined reference to `net_dim'
ena_netdev.c:(.text+0x7bd4): relocation truncated to fit:
R_AARCH64_CALL26 against undefined symbol `net_dim'

After commit 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive
interrupt moderation"), it introduces dim algorithm, which configured by CONFIG_DIMLIB.

Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/net/ethernet/amazon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/Kconfig b/drivers/net/ethernet/amazon/Kconfig
index 69ca99d..fe46df4 100644
--- a/drivers/net/ethernet/amazon/Kconfig
+++ b/drivers/net/ethernet/amazon/Kconfig
@@ -18,7 +18,7 @@ if NET_VENDOR_AMAZON
 
 config ENA_ETHERNET
 	tristate "Elastic Network Adapter (ENA) support"
-	depends on PCI_MSI && !CPU_BIG_ENDIAN
+	depends on PCI_MSI && !CPU_BIG_ENDIAN && DIMLIB
 	---help---
 	  This driver supports Elastic Network Adapter (ENA)"
 
-- 
2.7.4
