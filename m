From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 13:39:34 +0000
Subject: [PATCH -next] usb: gadget: mass_storage: use module_usb_composite_driver to simplify the code
Message-Id: <20200428133934.73637-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, zhengbin <zhengbin13@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

module_usb_composite_driver() makes the code simpler by
eliminating boilerplate code.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/legacy/mass_storage.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/legacy/mass_storage.c b/drivers/usb/gadget/legacy/mass_storage.c
index f18f77584fc2..9ed22c5fb7fe 100644
--- a/drivers/usb/gadget/legacy/mass_storage.c
+++ b/drivers/usb/gadget/legacy/mass_storage.c
@@ -229,18 +229,8 @@ static struct usb_composite_driver msg_driver = {
 	.unbind		= msg_unbind,
 };
 
+module_usb_composite_driver(msg_driver);
+
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Michal Nazarewicz");
 MODULE_LICENSE("GPL");
-
-static int __init msg_init(void)
-{
-	return usb_composite_probe(&msg_driver);
-}
-module_init(msg_init);
-
-static void __exit msg_cleanup(void)
-{
-	usb_composite_unregister(&msg_driver);
-}
-module_exit(msg_cleanup);
