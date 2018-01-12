From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 17:00:28 +0000
Subject: [PATCH 2/2] mvebu-mbus: Fix a typo in five comment lines
Message-Id: <0d0d1f9a-55e8-3a40-9ea7-e7496b72fe7a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4796228f-fa7f-24db-0049-2d2b9041c5b0@users.sourceforge.net>
In-Reply-To: <4796228f-fa7f-24db-0049-2d2b9041c5b0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 17:44:48 +0100

Adjust words in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/bus/mvebu-mbus.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 5844901aea0b..e0c1b07108a6 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -23,15 +23,14 @@
  *
  * This driver:
  *
- * - Reads out the SDRAM address decoding windows at initialization
- *   time, and fills the mvebu_mbus_dram_info structure with these
- *   informations. The exported function mv_mbus_dram_info() allow
- *   device drivers to get those informations related to the SDRAM
- *   address decoding windows. This is because devices also have their
- *   own windows (configured through registers that are part of each
- *   device register space), and therefore the drivers for Marvell
- *   devices have to configure those device -> SDRAM windows to ensure
- *   that DMA works properly.
+ * - Reads out the SDRAM address decoding windows at initialization time,
+ *   and fills the mvebu_mbus_dram_info structure with this information.
+ *   The exported function mv_mbus_dram_info() allows device drivers to get
+ *   this information related to the SDRAM address decoding windows.
+ *   This is because devices also have their own windows (configured through
+ *   registers that are part of each device register space), and therefore
+ *   the drivers for Marvell devices have to configure those device
+ *   -> SDRAM windows to ensure that DMA works properly.
  *
  * - Provides an API for platform code or device drivers to
  *   dynamically add or remove address decoding windows for the CPU ->
@@ -123,7 +122,7 @@ struct mvebu_mbus_soc_data {
 };
 
 /*
- * Used to store the state of one MBus window accross suspend/resume.
+ * Used to store the state of one MBus window across suspend/resume.
  */
 struct mvebu_mbus_win_data {
 	u32 ctrl;
-- 
2.15.1

