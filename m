From: Petr Vandrovec <vandrove@vc.cvut.cz>
Date: Fri, 03 Mar 2006 06:31:58 +0000
Subject: Re: [KJ][Patch] check return value of request_region in
Message-Id: <4407E2DE.5010809@vc.cvut.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78923048193528267=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============78923048193528267==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Darren Jenkins\ wrote:
> G'day list,
> 
> matroxfb_base.c calles 'request_region' @ 1737 without checking the
> return value.
> 
> The patch below adds a check for this and plugs into the existing error
> path.

Won't this conflict with reserving same I/O ports?  Only primary card 
succeeds with reservation, so if you really want to fix this "bug", then 
remove this I/O reservation from matroxfb completely, matroxfb never 
touches this I/O region, it just reserves it to make sure that you won't 
load vesafb and matroxfb for same head.  Your fix makes use of matroxfb 
with two Matrox cards in the box impossible, as on second card 0x3C0 
reservation must fail as first head made reservation already.
								Petr

> Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
> 
> --- linux-2.6.16-rc4/drivers/video/matrox/matroxfb_base.c.orig	2006-02-24 23:44:10.000000000 +1100
> +++ linux-2.6.16-rc4/drivers/video/matrox/matroxfb_base.c	2006-02-27 19:26:26.000000000 +1100
> @@ -1734,7 +1734,11 @@ static int initMatrox2(WPMINFO struct bo
>  #endif	/* CONFIG_MTRR */
>  
>  	if (!ACCESS_FBINFO(devflags.novga))
> -		request_region(0x3C0, 32, "matrox");
> +		if (!request_region(0x3C0, 32, "matrox")) {
> +			printk(KERN_ERR "matroxfb: failed to request_region");
> +			err = -EBUSY;
> +			goto failVideoIO;
> +		}
>  	matroxfb_g450_connect(PMINFO2);
>  	ACCESS_FBINFO(hw_switch->reset(PMINFO2));
>  
> 
> 
> 



--===============78923048193528267==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78923048193528267==--
