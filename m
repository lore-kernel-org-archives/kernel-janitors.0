From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 15 Nov 2012 23:25:58 +0000
Subject: Re: [PATCH v3] staging: dgrp: dgrp_tty.c: return an -EFAULT if put_user() fails
Message-Id: <20121115232558.GA31883@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1352981732-7864-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1352981732-7864-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org, alan@lxorguk.ukuu.org.uk, dan.carpenter@oracle.com

On Thu, Nov 15, 2012 at 05:45:32PM +0530, Kumar Amit Mehta wrote:
> Inspect the return value of put_user() and return -EFAULT on error.
> 
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>

This no longer applies to my tree, care to refresh and try again?

thanks,

greg k-h
