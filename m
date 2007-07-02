From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 02 Jul 2007 15:24:45 +0000
Subject: [KJ] another possible project: cleaning up
Message-Id: <Pine.LNX.4.64.0707021117220.23655@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  while this is technically cosmetic, a possible project would be to
bring the ioctl-number.txt file up to date as much as possible.  at
the moment, it's got a number of general flaws.

  first, there's the occasional obvious typo:

'd'     00-FF   linux/char/drm/drm/h    conflict!

  then there are a number of filenames that just aren't correct
for one reason or another:

'U'     00-EF   linux/drivers/usb/usb.h

  and it would seem that some of the entries aren't even *close* to
listing the files where some of those ioctls are being defined.
taking 'U' as an example, the file says this:

'U'     00-EF   linux/drivers/usb/usb.h
'U'     F0-FF   drivers/usb/auerswald.c

  now, on top of *both* of those filenames being wrong, it's easy to
see that there are more files that define ioctls based on that magic
number:

$ grep -rl "_IO.*'U'" *
drivers/bluetooth/hci_uart.h
drivers/usb/misc/auerswald.c
drivers/usb/misc/usbtest.c
fs/compat_ioctl.c
include/linux/usbdevice_fs.h
include/linux/uinput.h
include/sound/asound.h
sound/core/control_compat.c
usr/include/linux/usbdevice_fs.h
usr/include/linux/uinput.h
usr/include/sound/asound.h

  granted, that's an extreme example, but there's more like it.  is
this a cleanup worth doing?  and, if so, is anyone interested in doing
it?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
