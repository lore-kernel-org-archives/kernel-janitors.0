From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 08 Dec 2016 13:30:19 +0000
Subject: Re: [PATCH 0/5] staging-COMEDI: Fine-tuning for three functions
Message-Id: <20161208133019.GA30859@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
In-Reply-To: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Dec 08, 2016 at 12:30:20PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 8 Dec 2016 11:37:37 +0100
> 
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (5):
>   Combine four kcalloc() calls into one in serial2002_setup_subdevs()
>   Split a condition check in usbdux_alloc_usb_buffers()
>   Move an assignment in usbdux_alloc_usb_buffers()
>   Split a condition check in usbduxsigma_alloc_usb_buffers()
>   Move an assignment in usbduxsigma_alloc_usb_buffers()
> 
>  drivers/staging/comedi/drivers/serial2002.c  | 22 +++++-----
>  drivers/staging/comedi/drivers/usbdux.c      | 56 ++++++++++++++++++-----
>  drivers/staging/comedi/drivers/usbduxsigma.c | 66 ++++++++++++++++++++++------
>  3 files changed, 108 insertions(+), 36 deletions(-)

You do realize that I no longer take patches from you for any of the
subsystems I maintain, right?  This patch series is one reason why...

I suggest working on other projects to learn C better first.

best of luck,

greg k-h
