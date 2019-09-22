From: Mao Wenan <maowenan@huawei.com>
Date: Sun, 22 Sep 2019 05:38:08 +0000
Subject: [PATCH v2 net] net: ena: Select DIMLIB for ENA_ETHERNET
Message-Id: <20190922053808.117965-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921200741.1c3289e8@cakuba.netronome.com>
In-Reply-To: <20190921200741.1c3289e8@cakuba.netronome.com>
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
So, this patch is to select DIMLIB for ENA_ETHERNET.

Fixes: 282faf61a053 ("net: ena: switch to dim algorithm for rx adaptive interrupt moderation")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 v2: change subject of patch, use the "select" keyword instead of "depends".
 drivers/net/ethernet/amazon/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/amazon/Kconfig b/drivers/net/ethernet/amazon/Kconfig
index 69ca99d8ac26..cca72a75f551 100644
--- a/drivers/net/ethernet/amazon/Kconfig
+++ b/drivers/net/ethernet/amazon/Kconfig
@@ -19,6 +19,7 @@ if NET_VENDOR_AMAZON
 config ENA_ETHERNET
 	tristate "Elastic Network Adapter (ENA) support"
 	depends on PCI_MSI && !CPU_BIG_ENDIAN
+	select DIMLIB
 	---help---
 	  This driver supports Elastic Network Adapter (ENA)"
 
-- 
2.20.1
