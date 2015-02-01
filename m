From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 01 Feb 2015 18:12:36 +0000
Subject: Re: [PATCH] staging: gdm72xx: Deletion of an unnecessary check before the function call "kfree"
Message-Id: <20150201181236.GA12503@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54CE659D.5010607@users.sourceforge.net>
In-Reply-To: <54CE659D.5010607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Feb 01, 2015 at 06:42:53PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 1 Feb 2015 18:28:33 +0100
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/staging/gdm72xx/gdm_wimax.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/gdm72xx/gdm_wimax.c b/drivers/staging/gdm72xx/gdm_wimax.c
> index 9cab54b..ac901e6 100644
> --- a/drivers/staging/gdm72xx/gdm_wimax.c
> +++ b/drivers/staging/gdm72xx/gdm_wimax.c
> @@ -362,7 +362,7 @@ static int gdm_wimax_close(struct net_device *dev)
>  
>  static void kdelete(void **buf)
>  {
> -	if (buf && *buf) {
> +	if (buf) {
>  		kfree(*buf);
>  		*buf = NULL;
>  	}

Instead we should delete this function and have the driver use the
"correct" kfree calls instead, right?  That extra setting the buffer to
NULL is a waste for most of these calls.

thanks,

greg k-h
