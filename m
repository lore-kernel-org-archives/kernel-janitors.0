From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 16:26:47 +0000
Subject: [PATCH 2/2] drivers/ide/cy82c693.c: Add missing pci_dev_put
Message-Id: <1311870407-22461-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Pci_get_slot calls pci_dev_get, so pci_dev_put is needed before leaving the
function in the case where pci_get_slot is locally used.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
local idexpression x;
expression e;
@@

*x = pci_get_slot(...)
... when != true x = NULL
    when != pci_dev_put(x)
    when != e = x
    when != if (x != NULL) {<+... pci_dev_put(x); ...+>}
*return ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
Not tested.

 drivers/ide/cy82c693.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ide/cy82c693.c b/drivers/ide/cy82c693.c
index 3be60da..67cbcfa 100644
--- a/drivers/ide/cy82c693.c
+++ b/drivers/ide/cy82c693.c
@@ -141,6 +141,8 @@ static void cy82c693_set_pio_mode(ide_hwif_t *hwif, ide_drive_t *drive)
 		pci_write_config_byte(dev, CY82_IDE_SLAVE_IOW, time_16);
 		pci_write_config_byte(dev, CY82_IDE_SLAVE_8BIT, time_8);
 	}
+	if (hwif->index > 0)
+		pci_dev_put(dev);
 }
 
 static void __devinit init_iops_cy82c693(ide_hwif_t *hwif)

