From: Kumar amit mehta <gmate.amit@gmail.com>
Date: Fri, 22 Feb 2013 14:26:20 +0000
Subject: Re: [PATCH v2] staging: comedi: drivers: usbduxsigma.c: fix DMA buffers on stack
Message-Id: <20130222142619.GA11141@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361513228-8897-1-git-send-email-gmate.amit@gmail.com>
 <51274244.6080507@mev.co.uk>
In-Reply-To: <51274244.6080507@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>
Cc: gregkh@linuxfoundation.org, fmhess@users.sourceforge.net, hsweeten@visionengravers.com, dan.carpenter@oracle.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Feb 22, 2013 at 10:02:44AM +0000, Ian Abbott wrote:
> On 2013-02-22 06:07, Kumar Amit Mehta wrote:
> >This patch fixes an instance of DMA buffer on stack(being passed to
> >usb_control_msg)for the USB-DUXsigma Board driver. Found using smatch.
> >
> 
> Looks good here too.
> 
> Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
> 
> Would you mind doing the same for usbdux.c and usbduxfast.c?
Sure. 
As pointed out by Dan, Do you really want the buffer to be of 16 bytes, as we
are using only the first byte and passing the length as '1' in:
usbduxsub_start, usbduxsub_stop, usbduxfastsub_start, usbduxfastsub_stop ?

~Amit
