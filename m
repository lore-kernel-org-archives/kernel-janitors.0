From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 05 Sep 2019 09:42:22 +0000
Subject: [PATCH -next] xhci-ext-caps.c: Add missing platform_device_put() on error in xhci_create_intel_xhci_
Message-Id: <20190905100001.128349-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saranya Gopal <saranya.gopal@intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing platform_device_put() before return from
xhci_create_intel_xhci_sw_pdev() in the error handling case.

Fixes: 6ed151f26484 ("xhci-ext-caps.c: Add property to disable Intel SW switch")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/host/xhci-ext-caps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ext-caps.c b/drivers/usb/host/xhci-ext-caps.c
index f498160df969..3351d07c431f 100644
--- a/drivers/usb/host/xhci-ext-caps.c
+++ b/drivers/usb/host/xhci-ext-caps.c
@@ -57,6 +57,7 @@ static int xhci_create_intel_xhci_sw_pdev(struct xhci_hcd *xhci, u32 cap_offset)
 		ret = platform_device_add_properties(pdev, role_switch_props);
 		if (ret) {
 			dev_err(dev, "failed to register device properties\n");
+			platform_device_put(pdev);
 			return ret;
 		}
 	}
