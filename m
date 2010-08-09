From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 09 Aug 2010 19:49:35 +0000
Subject: [PATCH 04/18 v2] char: sx: call disable_pci_device() if pci_probe() failed
Message-Id: <1281383377-13657-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/sx.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/char/sx.c b/drivers/char/sx.c
index 5b24db4..759563e 100644
--- a/drivers/char/sx.c
+++ b/drivers/char/sx.c
@@ -2678,7 +2678,7 @@ static int __devinit sx_pci_probe(struct pci_dev *pdev,
 	retval = pci_request_region(pdev, reg, "sx");
 	if (retval) {
 		dev_err(&pdev->dev, "can't request region\n");
-		goto err_flag;
+		goto err_disable;
 	}
 	board->hw_base = pci_resource_start(pdev, reg);
 	board->base2 @@ -2711,6 +2711,8 @@ err_unmap:
 	iounmap(board->base2);
 err_reg:
 	pci_release_region(pdev, reg);
+err_disable:
+	pci_disable_device(pdev);
 err_flag:
 	board->flags &= ~SX_BOARD_PRESENT;
 err:
-- 
1.7.0.4

