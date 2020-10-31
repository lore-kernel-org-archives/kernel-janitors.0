From: Nigel Christian <nigel.l.christian@gmail.com>
Date: Sat, 31 Oct 2020 17:19:30 +0000
Subject: [PATCH] usb: core: ledtrig-usbport: use octal permission
Message-Id: <20201031171930.GA21555@fedora-project>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, lee.jones@linaro.org
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Change read/write for owner permission from symbolic to octal
to enhance readability. This patch reduces checkpatch warnings 
for this file to nil.

see: https://lkml.org/lkml/2016/8/2/1945

verified via chmod(2) man page

Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
---
 drivers/usb/core/ledtrig-usbport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index ba371a24ff78..8e9b1c5cc971 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -211,7 +211,7 @@ static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
 
 	sysfs_attr_init(&port->attr.attr);
 	port->attr.attr.name = port->port_name;
-	port->attr.attr.mode = S_IRUSR | S_IWUSR;
+	port->attr.attr.mode = 0600;
 	port->attr.show = usbport_trig_port_show;
 	port->attr.store = usbport_trig_port_store;
 
-- 
2.28.0
