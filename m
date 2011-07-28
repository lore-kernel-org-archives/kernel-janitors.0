From: Julia Lawall <julia@diku.dk>
Date: Thu, 28 Jul 2011 16:30:18 +0000
Subject: [PATCH 1/2] drivers/misc/cb710/core.c: Add missing pci_dev_put
Message-Id: <Pine.LNX.4.64.1107281829460.20584@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mirq-linux@rere.qmqm.pl
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Pci_get_slot calls pci_dev_get, so pci_dev_put is needed before leaving the
function.

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

 drivers/misc/cb710/core.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/cb710/core.c b/drivers/misc/cb710/core.c
index efec413..84983c7 100644
--- a/drivers/misc/cb710/core.c
+++ b/drivers/misc/cb710/core.c
@@ -41,7 +41,7 @@ static int __devinit cb710_pci_configure(struct pci_dev *pdev)
 
 	pci_read_config_dword(pdev, 0x48, &val);
 	if (val & 0x80000000)
-		return 0;
+		goto out;
 
 	if (!pdev0)
 		return -ENODEV;
@@ -59,6 +59,7 @@ static int __devinit cb710_pci_configure(struct pci_dev *pdev)
 	cb710_pci_update_config_reg(pdev0, 0x90,
 		~0x00060000, 0x00040000);
 
+out:
 	pci_dev_put(pdev0);
 
 	return 0;

