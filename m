From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:32:25 +0000
Subject: [PATCH 18/43] drivers/net/e1000e: fix sparse warning: Should it be
Message-Id: <20090214213152.24377.68475.stgit@vmbox.hanneseder.net>
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
  drivers/net/e1000e/82571.c:1229:5: warning: symbol 'e1000_check_for_serdes_link_82571' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/e1000e/82571.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/e1000e/82571.c b/drivers/net/e1000e/82571.c
index 565fd4e..51f8e84 100644
--- a/drivers/net/e1000e/82571.c
+++ b/drivers/net/e1000e/82571.c
@@ -1226,7 +1226,7 @@ static s32 e1000_setup_fiber_serdes_link_82571(struct e1000_hw *hw)
  *  Checks for link up on the hardware.  If link is not up and we have
  *  a signal, then we need to force link up.
  **/
-s32 e1000_check_for_serdes_link_82571(struct e1000_hw *hw)
+static s32 e1000_check_for_serdes_link_82571(struct e1000_hw *hw)
 {
 	struct e1000_mac_info *mac = &hw->mac;
 	u32 rxcw;

