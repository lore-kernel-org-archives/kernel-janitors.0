From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 04 Nov 2019 02:59:45 +0000
Subject: [PATCH -next] usb: gadget: Add dependency for USB_TEGRA_XUDC
Message-Id: <20191104025945.172620-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, treding@nvidia.com, nkristam@nvidia.com, arnd@arndb.de, johan@kernel.org, krzk@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

If CONFIG_USB_TEGRA_XUDC=y and CONFIG_USB_ROLE_SWITCH=m,
below erros can be seen:
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_remove':
tegra-xudc.c:(.text+0x6b0): undefined reference to `usb_role_switch_unregister'
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_probe':
tegra-xudc.c:(.text+0x1b88): undefined reference to `usb_role_switch_register'
drivers/usb/gadget/udc/tegra-xudc.o: In function `tegra_xudc_usb_role_sw_work':
tegra-xudc.c:(.text+0x5ecc): undefined reference to `usb_role_switch_get_role'

This patch add dependency USB_ROLE_SWITCH for UDC driver.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/usb/gadget/udc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index acaec3a..d103154 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -445,6 +445,7 @@ config USB_TEGRA_XUDC
 	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on PHY_TEGRA_XUSB
+	depends on USB_ROLE_SWITCH
 	help
 	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
 
-- 
2.7.4
