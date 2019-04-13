From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 13 Apr 2019 13:44:59 +0000
Subject: [PATCH] HID: fix compiling error in u2fzero_probe()
Message-Id: <20190413134459.76045-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jikos@kernel.org, benjamin.tissoires@redhat.com, maowenan@huawei.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

There is one compiling error in u2fzero_probe()->u2fzero_init_hwrng(),
this is because HW_RANDOM is not set.

drivers/hid/hid-u2fzero.o: In function `u2fzero_probe':
hid-u2fzero.c:(.text+0xc70): undefined reference to `devm_hwrng_register'

Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4dc1035..76d8206 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1017,6 +1017,7 @@ config HID_U2FZERO
 	tristate "U2F Zero LED and RNG support"
 	depends on USB_HID
 	depends on LEDS_CLASS
+	depends on HW_RANDOM
 	help
 	  Support for the LED of the U2F Zero device.
 
-- 
2.7.4
