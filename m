From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 18 Dec 2009 20:40:41 +0000
Subject: [PATCH 1/2] Fix misspelling of "successful" and variants in comments.
Message-Id: <1261168842-9996-1-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "successful" or variants of the word; this
fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/arm/mach-s5pc100/setup-sdhci.c      |    4 ++--
 drivers/net/sfc/mcdi_pcol.h              |    2 +-
 drivers/net/wimax/i2400m/fw.c            |    2 +-
 drivers/net/wireless/rt2x00/rt2x00link.c |    2 +-
 drivers/net/wireless/rt2x00/rt2x00usb.c  |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s5pc100/setup-sdhci.c b/arch/arm/mach-s5pc100/setup-sdhci.c
index 4385986..ea7ff19 100644
--- a/arch/arm/mach-s5pc100/setup-sdhci.c
+++ b/arch/arm/mach-s5pc100/setup-sdhci.c
@@ -28,8 +28,8 @@
 char *s5pc100_hsmmc_clksrcs[4] = {
 	[0] = "hsmmc",
 	[1] = "hsmmc",
-	/* [2] = "mmc_bus", not yet succesfuuly used yet */
-	/* [3] = "48m", - note not succesfully used yet */
+	/* [2] = "mmc_bus", not yet successfully used yet */
+	/* [3] = "48m", - note not successfully used yet */
 };
 
 
diff --git a/drivers/net/sfc/mcdi_pcol.h b/drivers/net/sfc/mcdi_pcol.h
index 2a85360..f61e1de 100644
--- a/drivers/net/sfc/mcdi_pcol.h
+++ b/drivers/net/sfc/mcdi_pcol.h
@@ -853,7 +853,7 @@
  * Poll for BIST completion
  *
  * Returns a single status code, and a binary blob of phy-specific
- * bist output. If the driver can't succesfully parse the BIST output,
+ * bist output. If the driver can't successfully parse the BIST output,
  * it should still respect the Pass/Fail in OUT.RESULT.
  *
  * Locks required: PHY_LOCK  if doing a  PHY BIST
diff --git a/drivers/net/wimax/i2400m/fw.c b/drivers/net/wimax/i2400m/fw.c
index 64cdfeb..40ee5f6 100644
--- a/drivers/net/wimax/i2400m/fw.c
+++ b/drivers/net/wimax/i2400m/fw.c
@@ -1595,7 +1595,7 @@ int i2400m_dev_bootstrap(struct i2400m *i2400m, enum i2400m_bri flags)
 		i2400m->fw_name = fw_name;
 		ret = i2400m_fw_bootstrap(i2400m, fw, flags);
 		release_firmware(fw);
-		if (ret >= 0)	/* firmware loaded succesfully */
+		if (ret >= 0)	/* firmware loaded successfully */
 			break;
 		i2400m->fw_name = NULL;
 	}
diff --git a/drivers/net/wireless/rt2x00/rt2x00link.c b/drivers/net/wireless/rt2x00/rt2x00link.c
index 0efbf5a..ffee9f8 100644
--- a/drivers/net/wireless/rt2x00/rt2x00link.c
+++ b/drivers/net/wireless/rt2x00/rt2x00link.c
@@ -240,7 +240,7 @@ void rt2x00link_update_stats(struct rt2x00_dev *rt2x00dev,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 
 	/*
-	 * Frame was received successfully since non-succesfull
+	 * Frame was received successfully since non-successful
 	 * frames would have been dropped by the hardware.
 	 */
 	qual->rx_success++;
diff --git a/drivers/net/wireless/rt2x00/rt2x00usb.c b/drivers/net/wireless/rt2x00/rt2x00usb.c
index 0a751e7..8b8c500 100644
--- a/drivers/net/wireless/rt2x00/rt2x00usb.c
+++ b/drivers/net/wireless/rt2x00/rt2x00usb.c
@@ -200,7 +200,7 @@ static void rt2x00usb_interrupt_txdone(struct urb *urb)
 	 * Obtain the status about this packet.
 	 * Note that when the status is 0 it does not mean the
 	 * frame was send out correctly. It only means the frame
-	 * was succesfully pushed to the hardware, we have no
+	 * was successfully pushed to the hardware, we have no
 	 * way to determine the transmission status right now.
 	 * (Only indirectly by looking at the failed TX counters
 	 * in the register).
-- 
1.6.3.3

