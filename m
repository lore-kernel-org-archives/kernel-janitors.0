From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 22 Feb 2013 10:02:44 +0000
Subject: Re: [PATCH v2] staging: comedi: drivers: usbduxsigma.c: fix DMA buffers on stack
Message-Id: <51274244.6080507@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361513228-8897-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1361513228-8897-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: Ian Abbott <ian.abbott@mev.co.uk>, "fmhess@users.sourceforge.net" <fmhess@users.sourceforge.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2013-02-22 06:07, Kumar Amit Mehta wrote:
> This patch fixes an instance of DMA buffer on stack(being passed to
> usb_control_msg)for the USB-DUXsigma Board driver. Found using smatch.
>

Looks good here too.

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

Would you mind doing the same for usbdux.c and usbduxfast.c?

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
