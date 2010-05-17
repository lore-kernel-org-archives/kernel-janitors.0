From: Greg KH <greg@kroah.com>
Date: Mon, 17 May 2010 23:31:51 +0000
Subject: Re: [PATCH 28/37] drivers/staging: Use kmemdup
Message-Id: <20100517233151.GB14911@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152321190.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152321190.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 15, 2010 at 11:21:43PM +0200, Julia Lawall wrote:
>  drivers/staging/cx25821/cx25821-audio-upstream.c        |   11 ++++-------
>  drivers/staging/cx25821/cx25821-video-upstream-ch2.c    |   12 ++++--------
>  drivers/staging/cx25821/cx25821-video-upstream.c        |   10 ++++------
>  drivers/staging/go7007/go7007-driver.c                  |    3 +--

I took this patch, with the exception of the above chunks.  Those need
to go through the v4l tree.

thanks,

greg k-h
