From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 08 Dec 2016 12:51:40 +0000
Subject: Re: [PATCH 4/5] staging: comedi: usbduxsigma: Split a condition check in usbduxsigma_alloc_usb_buffe
Message-Id: <45ac6168-19a8-0864-3b69-2d2409e2b44f@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
 <b50256ca-37c4-622a-fe69-d7419bdda0d4@users.sourceforge.net>
In-Reply-To: <b50256ca-37c4-622a-fe69-d7419bdda0d4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 08/12/16 11:37, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 8 Dec 2016 11:15:40 +0100
>
> The functions "kcalloc" and "kzalloc" were called in four cases by the
> function "usbduxsigma_alloc_usb_buffers" without checking immediately
> if they succeded.
> This issue was detected by using the Coccinelle software.
>
> Allocated memory was also not released if one of these function
> calls failed.
>
> * Reduce memory allocation sizes for two function calls.
>
> * Split a condition check for memory allocation failures.
>
> * Add more exception handling.
>
> Fixes: 65989c030bbca96be45ed137f6384dbd46030d10 ("staging: comedi: usbduxsigma: factor usb buffer allocation out of (*probe)")
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/comedi/drivers/usbduxsigma.c | 61 ++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 12 deletions(-)

My comments on PATCH 2/5 about how comedi drivers handle clean-up apply 
to this patch too.  So this patch will cause an Oops in the unlikely 
event of running out of memory during buffer allocation.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk> )=-
-=(                          Web: http://www.mev.co.uk/  )=-
