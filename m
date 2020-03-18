From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Mar 2020 16:01:08 +0000
Subject: [PATCH] usb: cdns3: fix spelling mistake "wrapperr" -> "wrapper"
Message-Id: <20200318160108.267403-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200122234437.2829803-1-colin.king@canonical.com>
In-Reply-To: <20200122234437.2829803-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index b0a29efe7d31..deeea618ba33 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -201,4 +201,4 @@ MODULE_DEVICE_TABLE(pci, cdns3_pci_ids);
 
 MODULE_AUTHOR("Pawel Laszczak <pawell@cadence.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Cadence USBSS PCI wrapperr");
+MODULE_DESCRIPTION("Cadence USBSS PCI wrapper");
-- 
2.25.1
