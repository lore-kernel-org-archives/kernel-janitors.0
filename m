From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 21 Jan 2013 12:59:57 +0000
Subject: Re: [PATCH 3/15] drivers/staging/omap-thermal/omap-bandgap.c: adjust duplicate test
Message-Id: <alpine.DEB.2.02.1301211359270.1930@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> >  	tsr = bg_ptr->conf->sensors[id].registers;
> >  	time = omap_bandgap_readl(bg_ptr, tsr->bgap_counter);
> > -	if (ret)
> > -		return ret;
> >  	time = (time & tsr->counter_mask) >> __ffs(tsr->counter_mask);
> >  	time = time * 1000 / bg_ptr->clk_rate;
> >
>
> since * and / have the same priority
>   (time*1000)/bg_ptr->clk_rate
> may be better
>
> just to serve my paranoia

OK, I can do that, but maybe not in the same patch?

julia
