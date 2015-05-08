From: Amit Shah <amit.shah@redhat.com>
Date: Fri, 08 May 2015 06:43:18 +0000
Subject: Re: [patch] virtio_console: use snprintf() for safety
Message-Id: <20150508063118.GA6361@grmbl.mre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150508061902.GA14769@mwanda>
In-Reply-To: <20150508061902.GA14769@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On (Fri) 08 May 2015 [09:19:02], Dan Carpenter wrote:
> My static checker complains that this sprintf() can overflow.
> 
> vdev->index is selected by ida_simple_get() in register_virtio_device()
> so my reading of the code is that this overflow is theoretically
> possible.  The max value of "id" is configurable and I'm not sure what
> typical values are.

vdev->index is per-device, and starts with 0 for the first attached
virtio-serial-pci device.  So to overflow, a lot of devices have to be
attached, which isn't possible with current qemu.  16 bytes was
already overkill..

> Anyway, it's simple enough to make the buffer larger and I changed it to
> snprintf() as well.

Any reason to choose 28?  I think 16 is enough.

The snprintf change is fine, though.


		Amit
