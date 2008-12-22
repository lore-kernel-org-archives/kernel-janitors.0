From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:16:32 +0000
Subject: [PATCH 11/27] drivers/net/igb: remove dead code (function
Message-Id: <20081222191632.11807.3776.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this warning:

  drivers/net/igb/e1000_mac.c:54: warning: 'igb_read_pci_cfg' defined but not used

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/igb/e1000_mac.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/net/igb/e1000_mac.c b/drivers/net/igb/e1000_mac.c
index 137269d..97f0049 100644
--- a/drivers/net/igb/e1000_mac.c
+++ b/drivers/net/igb/e1000_mac.c
@@ -50,13 +50,6 @@ void igb_remove_device(struct e1000_hw *hw)
 	kfree(hw->dev_spec);
 }
 
-static void igb_read_pci_cfg(struct e1000_hw *hw, u32 reg, u16 *value)
-{
-	struct igb_adapter *adapter = hw->back;
-
-	pci_read_config_word(adapter->pdev, reg, value);
-}
-
 static s32 igb_read_pcie_cap_reg(struct e1000_hw *hw, u32 reg, u16 *value)
 {
 	struct igb_adapter *adapter = hw->back;

