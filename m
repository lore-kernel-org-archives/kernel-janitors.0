From: "Dan Carpenter" <error27@gmail.com>
Date: Sun, 01 Apr 2007 16:03:09 +0000
Subject: Re: [KJ] [PATCH] request_region auditing
Message-Id: <a63d67fe0704010903g8d7cc53sa033b01fe7e34f67@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1175395299.3215.10.camel@localhost.localdomain>
In-Reply-To: <1175395299.3215.10.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/31/07, Brendan Burns <bburns@union.edu> wrote:
> from: Brendan Burns <bburns@cs.umass.edu>
>
> Auditing request_region calls
>
> Signed-off-by: Brendan Burns
> ---
> --- linux-2.6.20.4/drivers/video/matrox/matroxfb_base.c.orig    2007-03-31
> 22:21:14.000000000 -0400
> +++ linux-2.6.20.4/drivers/video/matrox/matroxfb_base.c 2007-03-31
> 22:21:49.000000000 -0400
> @@ -1735,7 +1735,8 @@ static int initMatrox2(WPMINFO struct bo
>  #endif /* CONFIG_MTRR */
>
>         if (!ACCESS_FBINFO(devflags.novga))
> -               request_region(0x3C0, 32, "matrox");
> +               if (!request_region(0x3C0, 32, "matrox"))
> +                       return -EBUSY;
>         matroxfb_g450_connect(PMINFO2);
>         ACCESS_FBINFO(hw_switch->reset(PMINFO2));

You need to do some more cleaning up before you return the error.

Take drivers/video/matrox/matroxfb_base.c as an example.  At the
bottom of the function there are a bunch of labels and gotos so
depending on how far it gets those are the things it has to clean up.

BTW janitors, Tejun Heo's managed resources patches are included in
2.6.21.  That should make this sort of thing easier.

http://lwn.net/Articles/222860/
http://lwn.net/Articles/215996/

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
