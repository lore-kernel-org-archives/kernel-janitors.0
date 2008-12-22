From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 19:15:45 +0000
Subject: [PATCH 06/27] drivers/net/atlx: fix sparse warnings: make symbols
Message-Id: <20081222191544.11807.31114.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:

  drivers/net/atlx/atl1.c:198:16: warning: symbol 'atl1_check_options' was not declared. Should it be static?
  drivers/net/atlx/atl1.c:526:5: warning: symbol 'atl1_read_mac_addr' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/atlx/atl1.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/atlx/atl1.c b/drivers/net/atlx/atl1.c
index aef7e47..c0ceee0 100644
--- a/drivers/net/atlx/atl1.c
+++ b/drivers/net/atlx/atl1.c
@@ -195,7 +195,7 @@ static int __devinit atl1_validate_option(int *value, struct atl1_option *opt,
  * value exists, a default value is used.  The final value is stored
  * in a variable in the adapter structure.
  */
-void __devinit atl1_check_options(struct atl1_adapter *adapter)
+static void __devinit atl1_check_options(struct atl1_adapter *adapter)
 {
 	struct pci_dev *pdev = adapter->pdev;
 	int bd = adapter->bd_number;
@@ -523,7 +523,7 @@ static int atl1_get_permanent_address(struct atl1_hw *hw)
  * Reads the adapter's MAC address from the EEPROM
  * hw - Struct containing variables accessed by shared code
  */
-s32 atl1_read_mac_addr(struct atl1_hw *hw)
+static s32 atl1_read_mac_addr(struct atl1_hw *hw)
 {
 	u16 i;
 

