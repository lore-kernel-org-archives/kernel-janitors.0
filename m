From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:38:36 +0000
Subject: [PATCH 24/43] drivers/net/ixgbe: fix sparse warning: Should it be
Message-Id: <20090214213822.24377.64757.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Make symbol static.

Fix this sparse warning:
  drivers/net/ixgbe/ixgbe_82598.c:59:5: warning: symbol 'ixgbe_get_pcie_msix_count_82598' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/ixgbe/ixgbe_82598.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ixgbe/ixgbe_82598.c b/drivers/net/ixgbe/ixgbe_82598.c
index 525bd87..51dba1c 100644
--- a/drivers/net/ixgbe/ixgbe_82598.c
+++ b/drivers/net/ixgbe/ixgbe_82598.c
@@ -56,7 +56,7 @@ static s32 ixgbe_read_i2c_eeprom_82598(struct ixgbe_hw *hw, u8 byte_offset,
  *  Read PCIe configuration space, and get the MSI-X vector count from
  *  the capabilities table.
  **/
-u16 ixgbe_get_pcie_msix_count_82598(struct ixgbe_hw *hw)
+static u16 ixgbe_get_pcie_msix_count_82598(struct ixgbe_hw *hw)
 {
 	struct ixgbe_adapter *adapter = hw->back;
 	u16 msix_count;

