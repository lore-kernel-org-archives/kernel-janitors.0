From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Mar 2015 09:34:50 +0000
Subject: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Message-Id: <20150311093450.GA3564@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to be signed for the error handling to work.  Valid modes are
small positive integers.

Fixes: b790ceeb0fd9 ('thinkpad_acpi: Add adaptive_kbd_mode sysfs attr')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 56eaddc..024861d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2938,7 +2938,7 @@ static ssize_t adaptive_kbd_mode_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
-	u32 current_mode;
+	int current_mode;
 
 	current_mode = adaptive_keyboard_get_mode();
 	if (current_mode < 0)
@@ -3621,7 +3621,7 @@ static int adaptive_keyboard_get_next_mode(int mode)
 
 static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 {
-	u32 current_mode = 0;
+	int current_mode = 0;
 	int new_mode = 0;
 	int keycode;
 
