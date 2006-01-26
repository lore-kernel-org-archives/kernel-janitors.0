From: Greg KH <greg@kroah.com>
Date: Thu, 26 Jan 2006 00:35:14 +0000
Subject: Re: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <20060126003514.GB22316@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54960387654122567=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138233643.7232.45.camel@alice>
In-Reply-To: <1138233643.7232.45.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============54960387654122567==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2006 at 01:00:43AM +0100, Eric Sesterhenn / snakebyte wrote:
> hi,
> 
> this changes if() BUG(); constructs to BUG_ON() which is
> cleaner and can better optimized away
> 
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
> 
> --- linux-2.6.16-rc1-git4/drivers/md/raid6main.c.orig	2006-01-26 00:30:19.000000000 +0100
> +++ linux-2.6.16-rc1-git4/drivers/md/raid6main.c	2006-01-26 00:32:31.000000000 +0100
> @@ -91,10 +91,8 @@ static void print_raid6_conf (raid6_conf
>  static void __release_stripe(raid6_conf_t *conf, struct stripe_head *sh)
>  {
>  	if (atomic_dec_and_test(&sh->count)) {
> -		if (!list_empty(&sh->lru))
> -			BUG();
> -		if (atomic_read(&conf->active_stripes)==0)
> -			BUG();
> +		BUG_ON(!list_empty(&sh->lru));
> +		BUG_ON(atomic_read(&conf->active_stripes)==0);

Also, no, do not do this!
If BUG_ON() is turned off, then the logic changes here.

thanks,

greg k-h

--===============54960387654122567==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54960387654122567==--
