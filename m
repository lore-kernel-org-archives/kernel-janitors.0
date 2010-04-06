From: Dan Carpenter <error27@gmail.com>
Date: Tue, 06 Apr 2010 10:44:29 +0000
Subject: [patch] asus: don't modify bluetooth/wlan on boot
Message-Id: <20100406104429.GB21229@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We were storing -1 as an unsigned int and as a result the effect of 
passing -1 was the same as using 1.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 475ab50..f532336 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -78,15 +78,15 @@ static uint wapf = 1;
 module_param(wapf, uint, 0644);
 MODULE_PARM_DESC(wapf, "WAPF value");
 
-static uint wlan_status = 1;
-static uint bluetooth_status = 1;
+static int wlan_status = 1;
+static int bluetooth_status = 1;
 
-module_param(wlan_status, uint, 0644);
+module_param(wlan_status, int, 0644);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is 1");
 
-module_param(bluetooth_status, uint, 0644);
+module_param(bluetooth_status, int, 0644);
 MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is 1");
