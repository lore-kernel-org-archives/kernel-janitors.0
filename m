From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 13:41:13 +0000
Subject: [PATCH -next] usb: dwc2: pci: Fix error return code in dwc2_pci_probe()
Message-Id: <1522244473-103213-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vardan Mikayelyan <mvardan@synopsys.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the alloc fail error handling
case instead of 0, as done elsewhere in this function.

Fixes: ecd29dabb2ba ("usb: dwc2: pci: Handle error cleanup in probe")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/dwc2/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index 7f21747..bea2e8e 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -141,8 +141,10 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 		goto err;
 
 	glue = devm_kzalloc(dev, sizeof(*glue), GFP_KERNEL);
-	if (!glue)
+	if (!glue) {
+		ret = -ENOMEM;
 		goto err;
+	}
 
 	ret = platform_device_add(dwc2);
 	if (ret) {

