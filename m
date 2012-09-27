From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 06:24:13 +0000
Subject: [PATCH usb:usb-next] USB: ezusb: make some vars/funcs static
Message-Id: <20120927062413.GA28643@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 drivers/usb/misc/ezusb.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   70c048a238c780c226eb4b115ebaa908cb3b34ec
commit: 70c048a238c780c226eb4b115ebaa908cb3b34ec [72/73] USB: ezusb: move ezusb.c from drivers/usb/serial to drivers/usb/misc

+ drivers/usb/misc/ezusb.c:25:22: sparse: symbol 'ezusb_fx1' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:30:22: sparse: symbol 'ezusb_fx2' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:39:5: sparse: symbol 'ezusb_writememory' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:63:5: sparse: symbol 'ezusb_set_reset' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:73:5: sparse: symbol 'ezusb_fx1_set_reset' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:79:5: sparse: symbol 'ezusb_fx2_set_reset' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:147:5: sparse: symbol 'ezusb_fx1_ihex_firmware_download' was not declared. Should it be static?
+ drivers/usb/misc/ezusb.c:154:5: sparse: symbol 'ezusb_fx2_ihex_firmware_download' was not declared. Should it be static?

--- linux-next.orig/drivers/usb/misc/ezusb.c	2012-09-27 14:16:27.914648701 +0800
+++ linux-next/drivers/usb/misc/ezusb.c	2012-09-27 14:16:38.158648945 +0800
@@ -22,12 +22,12 @@ struct ezusb_fx_type {
 	unsigned short max_internal_adress;
 };
 
-struct ezusb_fx_type ezusb_fx1 = {
+static struct ezusb_fx_type ezusb_fx1 = {
 	.cpucs_reg = 0x7F92,
 	.max_internal_adress = 0x1B3F,
 };
 
-struct ezusb_fx_type ezusb_fx2 = {
+static struct ezusb_fx_type ezusb_fx2 = {
 	.cpucs_reg = 0xE600,
 	.max_internal_adress = 0x3FFF,
 };
@@ -36,7 +36,7 @@ struct ezusb_fx_type ezusb_fx2 = {
 #define WRITE_INT_RAM 0xA0
 #define WRITE_EXT_RAM 0xA3
 
-int ezusb_writememory(struct usb_device *dev, int address,
+static int ezusb_writememory(struct usb_device *dev, int address,
 				unsigned char *data, int length, __u8 request)
 {
 	int result;
@@ -60,7 +60,7 @@ int ezusb_writememory(struct usb_device
 }
 EXPORT_SYMBOL_GPL(ezusb_writememory);
 
-int ezusb_set_reset(struct usb_device *dev, unsigned short cpucs_reg,
+static int ezusb_set_reset(struct usb_device *dev, unsigned short cpucs_reg,
 			 unsigned char reset_bit)
 {
 	int response = ezusb_writememory(dev, cpucs_reg, &reset_bit, 1, WRITE_INT_RAM);
@@ -70,13 +70,13 @@ int ezusb_set_reset(struct usb_device *d
 	return response;
 }
 
-int ezusb_fx1_set_reset(struct usb_device *dev, unsigned char reset_bit)
+static int ezusb_fx1_set_reset(struct usb_device *dev, unsigned char reset_bit)
 {
 	return ezusb_set_reset(dev, ezusb_fx1.cpucs_reg, reset_bit);
 }
 EXPORT_SYMBOL_GPL(ezusb_fx1_set_reset);
 
-int ezusb_fx2_set_reset(struct usb_device *dev, unsigned char reset_bit)
+static int ezusb_fx2_set_reset(struct usb_device *dev, unsigned char reset_bit)
 {
 	return ezusb_set_reset(dev, ezusb_fx2.cpucs_reg, reset_bit);
 }
@@ -144,14 +144,14 @@ out:
 	return ret;
 }
 
-int ezusb_fx1_ihex_firmware_download(struct usb_device *dev,
+static int ezusb_fx1_ihex_firmware_download(struct usb_device *dev,
 				     const char *firmware_path)
 {
 	return ezusb_ihex_firmware_download(dev, ezusb_fx1, firmware_path);
 }
 EXPORT_SYMBOL_GPL(ezusb_fx1_ihex_firmware_download);
 
-int ezusb_fx2_ihex_firmware_download(struct usb_device *dev,
+static int ezusb_fx2_ihex_firmware_download(struct usb_device *dev,
 				     const char *firmware_path)
 {
 	return ezusb_ihex_firmware_download(dev, ezusb_fx2, firmware_path);
