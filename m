From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 31 Jul 2018 14:38:52 +0000
Subject: [PATCH -next] usb: dwc3: pci: Fix return value check in dwc3_byt_enable_ulpi_refclock()
Message-Id: <1533047932-33559-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9929ebff-fdba-1da6-3032-b31acd5c3680@redhat.com>
In-Reply-To: <9929ebff-fdba-1da6-3032-b31acd5c3680@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function pcim_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 7740d04d901d ("usb: dwc3: pci: Enable ULPI Refclk on platforms where the firmware does not")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 5edd794..1286076 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -85,8 +85,8 @@ static int dwc3_byt_enable_ulpi_refclock(struct pci_dev *pci)
 	u32		value;
 
 	reg = pcim_iomap(pci, GP_RWBAR, 0);
-	if (IS_ERR(reg))
-		return PTR_ERR(reg);
+	if (!reg)
+		return -ENOMEM;
 
 	value = readl(reg + GP_RWREG1);
 	if (!(value & GP_RWREG1_ULPI_REFCLK_DISABLE))

