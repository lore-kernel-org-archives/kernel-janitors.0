From: Greg KH <gregkh@suse.de>
Date: Sat, 11 Jul 2009 17:04:56 +0000
Subject: Re: [PATCH 5/5, revised] staging/otus: Drop an unnecessary NULL
Message-Id: <20090711170456.GB5205@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907111031480.29592@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907111031480.29592@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jirislaby@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 11, 2009 at 10:32:23AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Apparently, the NULL test is not necessary at this point.
> 
> The semantic patch that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> type T;
> expression E;
> identifier i,fld;
> statement S;
> @@
> 
> - T i = E->fld;
> + T i;
>   ... when != E
>       when != i
>   if (E = NULL) S
> + i = E->fld;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/staging/otus/wwrap.c |    5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/staging/otus/wwrap.c b/drivers/staging/otus/wwrap.c
> index 4db8f6e..855ff41 100644
> --- a/drivers/staging/otus/wwrap.c
> +++ b/drivers/staging/otus/wwrap.c
> @@ -1018,11 +1018,6 @@ void kevent(struct work_struct *work)
>                 container_of(work, struct usbdrv_private, kevent);
>      zdev_t *dev = macp->device;
>  
> -    if (macp = NULL)
> -    {
> -        return;
> -    }
> -

Ok, that will teach me to read all of my mail before responding... :)

This looks good, I'll queue it up, thanks.

greg k-h
