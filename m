From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 18 Sep 2006 06:13:28 +0000
Subject: Re: [KJ] [Bluez-devel] bluetooth drivers : kmalloc to kzalloc
Message-Id: <1158560008.30486.12.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
In-Reply-To: <6b4e42d10609171754q7c7335f9pfab703d6b746236b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: BlueZ development <bluez-devel@lists.sourceforge.net>
Cc: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, bluez-devel@lists.sf.net

Hi Om,

> Tested by compiling with $make allmodconfig; make
> 
> Signed off by Om Narasimhan <om.turyx@gmail.com>
> 
>  drivers/bluetooth/bfusb.c   |    2 +-
>  drivers/bluetooth/hci_usb.c |   11 +++++------
>  2 files changed, 6 insertions(+), 7 deletions(-)

the kzalloc is suppose to replace a kmalloc followed by a memset
operation. It is not the case for these changes and so these changes
make no sense.

Regards

Marcel


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
