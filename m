From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 11:20:46 +0000
Subject: Re: [PATCH] drbd: Deletion of an unnecessary check before the function call "lc_destroy"
Message-Id: <558FD88E.6070304@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <546C9076.2030500@users.sourceforge.net>
In-Reply-To: <546C9076.2030500@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>, drbd-user@lists.linbit.com
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Nov 2014 13:33:32 +0100
> 
> The lc_destroy() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/drbd/drbd_nl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index 1cd47df..0bcb3e0 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1115,8 +1115,7 @@ static int drbd_check_al_size(struct drbd_device *device, struct disk_conf *dc)
>  		lc_destroy(n);
>  		return -EBUSY;
>  	} else {
> -		if (t)
> -			lc_destroy(t);
> +		lc_destroy(t);
>  	}
>  	drbd_md_mark_dirty(device); /* we changed device->act_log->nr_elemens */
>  	return 0;
> 

Would you like to integrate this update suggestion
into another source code repository?

Regards,
Markus
