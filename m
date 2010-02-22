From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Feb 2010 04:56:34 +0000
Subject: i1480: endian question
Message-Id: <20100222045634.GB4853@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I'm trying to use smatch to find endian issues.

drivers/uwb/i1480/dfu/usb.c
   120                  result = usb_control_msg(
   121                          i1480_usb->usb_dev, usb_sndctrlpipe(i1480_usb->usb_dev, 0),
   122                          0xf0, USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
   123                          cpu_to_le16(memory_address & 0xffff),
   124                          cpu_to_le16((memory_address >> 16) & 0xffff),
   125                          i1480->cmd_buf, buffer_size, 100 /* FIXME: arbitrary */);


Is it right to use cpu_to_le16() here?  I think it should be cpu endian 
here because we call cpu_to_le16() inside the usb_control_msg() function.

Also in the i1480_usb_read() function:
drivers/uwb/i1480/dfu/usb.c
   166                  result = usb_control_msg(
   167                          i1480_usb->usb_dev, usb_rcvctrlpipe(i1480_usb->usb_dev, 0),
   168                          0xf0, USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
   169                          cpu_to_le16(itr_addr & 0xffff),
   170                          cpu_to_le16((itr_addr >> 16) & 0xffff),
   171                          i1480->cmd_buf + itr, itr_size,
   172                          100 /* FIXME: arbitrary */);

regards,
dan carpenter
