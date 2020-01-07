From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jan 2020 13:06:07 +0000
Subject: [PATCH 2/2] ide: serverworks: potential overflow in svwks_set_pio_mode()
Message-Id: <20200107130607.tv3uosduwkw3yka6@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200107130441.y3owvcnxdljailt5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

The "drive->dn" variable is a u8 controlled by root.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/ide/serverworks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ide/serverworks.c b/drivers/ide/serverworks.c
index ac6fc3fffa0d..458e72e034b0 100644
--- a/drivers/ide/serverworks.c
+++ b/drivers/ide/serverworks.c
@@ -115,6 +115,9 @@ static void svwks_set_pio_mode(ide_hwif_t *hwif, ide_drive_t *drive)
 	struct pci_dev *dev = to_pci_dev(hwif->dev);
 	const u8 pio = drive->pio_mode - XFER_PIO_0;
 
+	if (drive->dn >= ARRAY_SIZE(drive_pci))
+		return;
+
 	pci_write_config_byte(dev, drive_pci[drive->dn], pio_modes[pio]);
 
 	if (svwks_csb_check(dev)) {
@@ -141,6 +144,9 @@ static void svwks_set_dma_mode(ide_hwif_t *hwif, ide_drive_t *drive)
 
 	u8 ultra_enable	 = 0, ultra_timing = 0, dma_timing = 0;
 
+	if (drive->dn >= ARRAY_SIZE(drive_pci2))
+		return;
+
 	pci_read_config_byte(dev, (0x56|hwif->channel), &ultra_timing);
 	pci_read_config_byte(dev, 0x54, &ultra_enable);
 
-- 
2.11.0
