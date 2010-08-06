From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:50:39 +0000
Subject: [PATCH 05/18] char: synclink: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124241-13198-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Stephen Hemminger <shemminger@vyatta.com>, Jiri Slaby <jslaby@suse.cz>, "David S. Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/synclink.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/synclink.c b/drivers/char/synclink.c
index a2a5800..14e45c5 100644
--- a/drivers/char/synclink.c
+++ b/drivers/char/synclink.c
@@ -8079,6 +8079,7 @@ static int __devinit synclink_init_one (struct pci_dev *dev,
 
 	if (!(info = mgsl_allocate_device())) {
 		printk("can't allocate device instance data.\n");
+		pci_disable_device(dev);
 		return -EIO;
 	}
 
-- 
1.7.0.4

