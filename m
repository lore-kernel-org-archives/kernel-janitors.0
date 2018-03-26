From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 06:43:57 +0000
Subject: [PATCH -next] usb: roles: Fix return value check in intel_xhci_usb_probe()
Message-Id: <1522046637-17785-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap_nocache() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: f6fb9ec02be1 ("usb: roles: Add Intel xHCI USB role switch driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/roles/intel-xhci-usb-role-switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/roles/intel-xhci-usb-role-switch.c b/drivers/usb/roles/intel-xhci-usb-role-switch.c
index 58c1b60..de72eed 100644
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@ -145,8 +145,8 @@ static int intel_xhci_usb_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->base = devm_ioremap_nocache(dev, res->start, resource_size(res));
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
+	if (!data->base)
+		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(allow_userspace_ctrl_ids); i++)
 		if (acpi_dev_present(allow_userspace_ctrl_ids[i].hid, "1",

