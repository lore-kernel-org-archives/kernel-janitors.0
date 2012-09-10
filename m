From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 10 Sep 2012 16:40:15 +0000
Subject: [balbi-usb:master 33/36] drivers/usb/gadget/serial.c:89:22: sparse: cast truncates bits from constan
Message-Id: <20120910164015.GA16252@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git master
head:   d9c88901337158c9f253a7de58a10b5125d61d26
commit: 7a7322b0a5d984025dd4faea9098b8fef07f8d8f [33/36] usb: gadget: remove usb_gadget_controller_number()

All sparse warnings:

  drivers/usb/gadget/f_acm.c:287:9: sparse: advancing past deep designator
  drivers/usb/gadget/f_obex.c:60:9: sparse: advancing past deep designator
  drivers/usb/gadget/f_serial.c:134:9: sparse: advancing past deep designator
  drivers/usb/gadget/serial.c:66:9: sparse: advancing past deep designator
+ drivers/usb/gadget/serial.c:89:22: sparse: cast truncates bits from constant value (24000000 becomes 0)

vim +89 drivers/usb/gadget/serial.c
    79	static struct usb_device_descriptor device_desc = {
    80		.bLength =		USB_DT_DEVICE_SIZE,
    81		.bDescriptorType =	USB_DT_DEVICE,
    82		.bcdUSB =		cpu_to_le16(0x0200),
    83		/* .bDeviceClass = f(use_acm) */
    84		.bDeviceSubClass =	0,
    85		.bDeviceProtocol =	0,
    86		/* .bMaxPacketSize0 = f(hardware) */
    87		.idVendor =		cpu_to_le16(GS_VENDOR_ID),
    88		/* .idProduct =	f(use_acm) */
  > 89		.bcdDevice = cpu_to_le16(GS_VERSION_NUM << 16),
    90		/* .iManufacturer = DYNAMIC */
    91		/* .iProduct = DYNAMIC */
    92		.bNumConfigurations =	1,
    93	};
    94	
    95	static struct usb_otg_descriptor otg_descriptor = {
    96		.bLength =		sizeof otg_descriptor,
    97		.bDescriptorType =	USB_DT_OTG,
    98	
    99		/* REVISIT SRP-only hardware is possible, although

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
