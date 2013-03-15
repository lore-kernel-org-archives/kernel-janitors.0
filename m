From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 15 Mar 2013 16:04:45 +0000
Subject: Re: [PATCH] staging: comedi: drivers: ni_atmio.c: Add a missing semicolon
Message-Id: <20130315160445.GA24062@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: abbotti@mev.co.uk, devel@driverdev.osuosl.org, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 15, 2013 at 01:14:29AM -0700, Kumar Amit Mehta wrote:
> fix a missing end-of-statement by adding a semicolon.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> ---
>  drivers/staging/comedi/drivers/ni_atmio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hartley sent a fix for this yesterday, sorry about not applying it
sooner.

greg k-h
