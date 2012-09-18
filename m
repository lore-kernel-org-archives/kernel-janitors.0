From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 18 Sep 2012 14:04:06 +0000
Subject: [usb:usb-next 25/32] drivers/usb/serial/omninet.c:165:6: warning: unused variable 'i'
Message-Id: <20120918140406.GA16749@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Greg,

FYI, there are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   07764958947c381ef095fc69503c1ef1775f316e
commit: 6e03b8cecbd836f729afe1a50814544baa5e5f97 [25/32] USB: Serial: omninet.c: remove debug module parameter
config: x86_64-allmodconfig

All error/warnings:

drivers/usb/serial/omninet.c: In function 'omninet_read_bulk_callback':
drivers/usb/serial/omninet.c:165:6: warning: unused variable 'i' [-Wunused-variable]

vim +165 drivers/usb/serial/omninet.c
   155	#define OMNINET_HEADERLEN	sizeof(struct omninet_header)
   156	#define OMNINET_BULKOUTSIZE 	(64 - OMNINET_HEADERLEN)
   157	
   158	static void omninet_read_bulk_callback(struct urb *urb)
   159	{
   160		struct usb_serial_port 	*port 	= urb->context;
   161		unsigned char 		*data 	= urb->transfer_buffer;
   162		struct omninet_header 	*header = (struct omninet_header *) &data[0];
   163		int status = urb->status;
   164		int result;
 > 165		int i;
   166	
   167		if (status) {
   168			dev_dbg(&port->dev, "%s - nonzero read bulk status received: %d\n",
   169				__func__, status);
   170			return;
   171		}
   172	
   173		if (urb->actual_length && header->oh_len) {
   174			struct tty_struct *tty = tty_port_tty_get(&port->port);
   175			if (tty) {

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
