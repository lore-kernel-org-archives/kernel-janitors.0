From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:49:29 +0000
Subject: [PATCH 04/18] char: sx: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124171-12751-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if pci_request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/sx.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/sx.c b/drivers/char/sx.c
index 5b24db4..5140b0d 100644
--- a/drivers/char/sx.c
+++ b/drivers/char/sx.c
@@ -2711,6 +2711,7 @@ err_unmap:
 	iounmap(board->base2);
 err_reg:
 	pci_release_region(pdev, reg);
+	pci_disable_device(pdev);
 err_flag:
 	board->flags &= ~SX_BOARD_PRESENT;
 err:
-- 
1.7.0.4

