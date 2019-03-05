From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Mar 2019 11:47:46 +0000
Subject: [PATCH] misc: rtsx: clean up some indenting
Message-Id: <20190305114746.GA17627@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: RickyWu <ricky_wu@realtek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

These lines weren't indented far enough.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/cardreader/rts5260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cardreader/rts5260.c b/drivers/misc/cardreader/rts5260.c
index da22bcb62b04..4a2589bdc8ce 100644
--- a/drivers/misc/cardreader/rts5260.c
+++ b/drivers/misc/cardreader/rts5260.c
@@ -455,13 +455,13 @@ static void rts5260_pwr_saving_setting(struct rtsx_pcr *pcr)
 		pcr_dbg(pcr, "Set parameters for L1.2.");
 		rtsx_pci_write_register(pcr, PWR_GLOBAL_CTRL,
 					0xFF, PCIE_L1_2_EN);
-	rtsx_pci_write_register(pcr, RTS5260_DVCC_CTRL,
+		rtsx_pci_write_register(pcr, RTS5260_DVCC_CTRL,
 					RTS5260_DVCC_OCP_EN |
 					RTS5260_DVCC_OCP_CL_EN,
 					RTS5260_DVCC_OCP_EN |
 					RTS5260_DVCC_OCP_CL_EN);
 
-	rtsx_pci_write_register(pcr, PWR_FE_CTL,
+		rtsx_pci_write_register(pcr, PWR_FE_CTL,
 					0xFF, PCIE_L1_2_PD_FE_EN);
 	} else if (lss_l1_1) {
 		pcr_dbg(pcr, "Set parameters for L1.1.");
-- 
2.17.1
