From: Colin King <colin.king@canonical.com>
Date: Tue, 01 May 2018 15:10:50 +0000
Subject: [PATCH] parport: parport_serial: Add WCH CH382L PCIe single parallel port support
Message-Id: <20180501151050.15399-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The WCH CH382L PCIe adapter has 1 parallel port but unlike the similar
WCH CH328 adapter there are no serial ports connected to it.

PCIe device ID 1c00:3050:

02:00.0 Serial controller: Device 1c00:3050 (rev 10) (prog-if 05 [16850])
	Subsystem: Device 1c00:3050
	Flags: fast devsel, IRQ 16
	I/O ports at 2000 [size%6]
	Memory at d0000000 (32-bit, prefetchable) [size2K]
	I/O ports at 2100 [size=4]
	Expansion ROM at b0200000 [disabled] [size2K]
	Capabilities: [60] Power Management version 3
	Capabilities: [68] MSI: Enable- Count=1/32 Maskable+ 64bit+
	Capabilities: [80] Express Legacy Endpoint, MSI 00
	Capabilities: [100] Advanced Error Reporting
	Kernel driver in use: parport_pc
	Kernel modules: parport_pc, parport_serial

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/parport/parport_serial.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/parport/parport_serial.c b/drivers/parport/parport_serial.c
index ae9e01ef7599..b71cfe0f82e1 100644
--- a/drivers/parport/parport_serial.c
+++ b/drivers/parport/parport_serial.c
@@ -58,6 +58,7 @@ enum parport_pc_pci_cards {
 	timedia_9079c,
 	wch_ch353_1s1p,
 	wch_ch353_2s1p,
+	wch_ch382_0s1p,
 	wch_ch382_2s1p,
 	brainboxes_5s1p,
 	sunix_2s1p,
@@ -147,6 +148,7 @@ static struct parport_pc_pci cards[] = {
 	/* timedia_9079c */             { 1, { { 2, 3 }, } },
 	/* wch_ch353_1s1p*/             { 1, { { 1, -1}, } },
 	/* wch_ch353_2s1p*/             { 1, { { 2, -1}, } },
+	/* wch_ch382_0s1p*/		{ 1, { { 2, -1}, } },
 	/* wch_ch382_2s1p*/             { 1, { { 2, -1}, } },
 	/* brainboxes_5s1p */           { 1, { { 3, -1 }, } },
 	/* sunix_2s1p */                { 1, { { 3, -1 }, } },
@@ -252,6 +254,7 @@ static struct pci_device_id parport_serial_pci_tbl[] = {
 	/* WCH CARDS */
 	{ 0x4348, 0x5053, PCI_ANY_ID, PCI_ANY_ID, 0, 0, wch_ch353_1s1p},
 	{ 0x4348, 0x7053, 0x4348, 0x3253, 0, 0, wch_ch353_2s1p},
+	{ 0x1c00, 0x3050, 0x1c00, 0x3050, 0, 0, wch_ch382_0s1p},
 	{ 0x1c00, 0x3250, 0x1c00, 0x3250, 0, 0, wch_ch382_2s1p},
 
 	/* BrainBoxes PX272/PX306 MIO card */
@@ -494,6 +497,12 @@ static struct pciserial_board pci_parport_serial_boards[] = {
 		.base_baud      = 115200,
 		.uart_offset    = 8,
 	},
+	[wch_ch382_0s1p] = {
+		.flags          = FL_BASE0,
+		.num_ports      = 0,
+		.base_baud      = 115200,
+		.uart_offset    = 8,
+	},
 	[wch_ch382_2s1p] = {
 		.flags          = FL_BASE0,
 		.num_ports      = 2,
-- 
2.17.0

