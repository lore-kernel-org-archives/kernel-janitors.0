From: matt mooney <mfm@muteddisk.com>
Date: Fri, 20 May 2011 04:37:06 +0000
Subject: [PATCH 12/12] staging: usbip: vhci_hcd.c: rename init and exit functions
Message-Id: <bd7f81f595fb8b19530f0a5373092fa27d58e7c1.1305866084.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305866084.git.mfm@muteddisk.com>
In-Reply-To: <cover.1305866084.git.mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Change the prefix of the __init and __exit functions to vhci_hcd_ to
correspond with the modules name. And change the suffix of the __exit
function to exit instead of cleanup.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/staging/usbip/vhci_hcd.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/usbip/vhci_hcd.c b/drivers/staging/usbip/vhci_hcd.c
index 5b94b80..359b464 100644
--- a/drivers/staging/usbip/vhci_hcd.c
+++ b/drivers/staging/usbip/vhci_hcd.c
@@ -1209,7 +1209,7 @@ static struct platform_device the_pdev = {
 	},
 };
 
-static int __init vhci_init(void)
+static int __init vhci_hcd_init(void)
 {
 	int ret;
 
@@ -1233,14 +1233,14 @@ err_driver_register:
 	return ret;
 }
 
-static void __exit vhci_cleanup(void)
+static void __exit vhci_hcd_exit(void)
 {
 	platform_device_unregister(&the_pdev);
 	platform_driver_unregister(&vhci_driver);
 }
 
-module_init(vhci_init);
-module_exit(vhci_cleanup);
+module_init(vhci_hcd_init);
+module_exit(vhci_hcd_exit);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
-- 
1.7.5.1

