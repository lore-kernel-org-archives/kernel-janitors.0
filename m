From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 04 Nov 2019 14:48:50 +0000
Subject: [PATCH -next] usb: roles: Hide option USB_ROLE_SWITCH
Message-Id: <20191104144850.91305-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191104135312.GD996639@ulmo>
In-Reply-To: <20191104135312.GD996639@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, maowenan@huawei.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The USB role switch class is, after all,
not useful by itself. Hiding USB_ROLE_SWITCH
so we can avoid any of the pitfalls associated
with user-visible symbols and "select".

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/usb/roles/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
index f8b31aa..1da58d4 100644
--- a/drivers/usb/roles/Kconfig
+++ b/drivers/usb/roles/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 config USB_ROLE_SWITCH
-	tristate "USB Role Switch Support"
+	tristate
 	help
 	  USB Role Switch is a device that can select the USB role - host or
 	  device - for a USB port (connector). In most cases dual-role capable
-- 
2.7.4
