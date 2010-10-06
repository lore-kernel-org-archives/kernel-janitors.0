From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:39 +0000
Subject: [PATCH 24/28] Staging: comedi: drivers: adv_pci_dio.c: Edit file so that checkpatch.pl has 3 warning
Message-Id: <1286326843-6170-24-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed a few lines that made checkpatch.pl complain. Except a few warnings and
error.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/drivers/adv_pci_dio.c |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/comedi/drivers/adv_pci_dio.c b/drivers/staging/comedi/drivers/adv_pci_dio.c
index d018bb4..aafefd8 100644
--- a/drivers/staging/comedi/drivers/adv_pci_dio.c
+++ b/drivers/staging/comedi/drivers/adv_pci_dio.c
@@ -12,20 +12,20 @@ Description: Advantech PCI-1730, PCI-1733, PCI-1734, PCI-1735U,
 	PCI-1754, PCI-1756, PCI-1762
 Author: Michal Dobes <dobes@tesnet.cz>
 Devices: [Advantech] PCI-1730 (adv_pci_dio), PCI-1733,
-  PCI-1734, PCI-1735U, PCI-1736UP, PCI-1750,
-  PCI-1751, PCI-1752, PCI-1753,
-  PCI-1753+PCI-1753E, PCI-1754, PCI-1756,
-  PCI-1760, PCI-1762
+	PCI-1734, PCI-1735U, PCI-1736UP, PCI-1750,
+	PCI-1751, PCI-1752, PCI-1753,
+	PCI-1753+PCI-1753E, PCI-1754, PCI-1756,
+	PCI-1760, PCI-1762
 Status: untested
 Updated: Tue, 04 May 2010 13:00:00 +0000
 
 This driver supports now only insn interface for DI/DO/DIO.
 
 Configuration options:
-  [0] - PCI bus of device (optional)
-  [1] - PCI slot of device (optional)
-	If bus/slot is not specified, the first available PCI
-	device will be used.
+	[0] - PCI bus of device (optional)
+	[1] - PCI slot of device (optional)
+		If bus/slot is not specified, the first available PCI
+		device will be used.
 
 */
 
-- 
1.7.3.1.50.g1e633

