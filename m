From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Jul 2016 09:45:40 +0000
Subject: Re: [PATCH] cdrom: Delete an unnecessary check before unregister_sysctl_table()
Message-Id: <e2d8fe80-bbbe-0f39-e4c4-d0e68749de39@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <559E2A11.60105@users.sourceforge.net>
In-Reply-To: <559E2A11.60105@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 9 Jul 2015 09:52:24 +0200
> 
> The unregister_sysctl_table() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/cdrom/cdrom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 5d28a45..e43e84d 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3698,8 +3698,7 @@ static void cdrom_sysctl_register(void)
>  
>  static void cdrom_sysctl_unregister(void)
>  {
> -	if (cdrom_sysctl_header)
> -		unregister_sysctl_table(cdrom_sysctl_header);
> +	unregister_sysctl_table(cdrom_sysctl_header);
>  }
>  
>  #else /* CONFIG_SYSCTL */
> 

How do you think about to integrate this update suggestion
into another source code repository?

Regards,
Markus
