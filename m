From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 16 Jun 2018 07:03:01 +0000
Subject: Re: [PATCH] media: staging: atomisp: add a blank line after declarations
Message-Id: <20180616070301.GA30558@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2750553.3y1WJKmnP5@joonhwan-virtualbox>
In-Reply-To: <2750553.3y1WJKmnP5@joonhwan-virtualbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "JoonHwan.Kim" <spilit464@gmail.com>
Cc: alan@linux.intel.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-media@vger.kernel.org

On Sat, Jun 16, 2018 at 01:30:48PM +0900, JoonHwan.Kim wrote:
> fix checkpatch.pl warning:
>   * Missing a blank line after declarations
> 
> Signed-off-by: Joonhwan Kim <spilit464@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c | 5 +++++

Always work against the latest development tree so you do not duplicate
work.  This file is gone in Linus's tree, and in linux-next :(

thanks,

greg k-h
