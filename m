From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Jun 2015 11:34:15 +0000
Subject: Re: [PATCH] block-skd: Deletion of an unnecessary check before the function call "kfree"
Message-Id: <558FDBB7.3030301@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net> <547CA303.9000001@users.sourceforge.net>
In-Reply-To: <547CA303.9000001@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Dec 2014 18:15:46 +0100
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/skd_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
> index 1e46eb2..c4b0259 100644
> --- a/drivers/block/skd_main.c
> +++ b/drivers/block/skd_main.c
> @@ -3998,8 +3998,7 @@ static int skd_acquire_msix(struct skd_device *skdev)
>  	return 0;
>  
>  msix_out:
> -	if (entries)
> -		kfree(entries);
> +	kfree(entries);
>  	skd_release_msix(skdev);
>  	return rc;
>  }
> 

Would anybody like to integrate this update suggestion
into another source code repository?

Regards,
Markus
