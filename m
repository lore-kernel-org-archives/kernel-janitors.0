From: Heiko Stuebner <heiko@sntech.de>
Date: Tue, 15 Oct 2019 20:29:03 +0000
Subject: Re: clk: rockchip: Checking a kmemdup() call in rockchip_clk_register_pll()
Message-Id: <5173392.uhhkXBHGmO@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
 <2588953.0pqkEXWxhN@phil> <45588ab8-2a6c-3f29-61ff-bccf8d6fb291@web.de>
In-Reply-To: <45588ab8-2a6c-3f29-61ff-bccf8d6fb291@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Kangjie Lu <kjlu@umn.edu>, Michael Turquette <mturquette@baylibre.com>, Stephen McCamant <smccaman@umn.edu>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Navid Emamdoost <emamd001@umn.edu>, Aditya Pakki <pakki001@umn.edu>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Am Montag, 14. Oktober 2019, 09:26:41 CEST schrieb Markus Elfring:
> > The other option would be to panic, but the kernel should not
> > panic if other options are available - and continuing with a static
> > pll frequency is less invasive in the error case.
> 
> I would like to point out that this function implementation contains
> the following source code already.
> 
> …
> 	/* name the actual pll */
> 	snprintf(pll_name, sizeof(pll_name), "pll_%s", name);
> 
> 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
> 	if (!pll)
> 		return ERR_PTR(-ENOMEM);
> …
> 
> 
> 
> …
> > +++ b/drivers/clk/rockchip/clk-pll.c
> > @@ -909,14 +909,16 @@ struct clk *rockchip_clk_register_pll(struct rockchip_clk_provider *ctx,
> …
> > -		pll->rate_count = len;
> >  		pll->rate_table = kmemdup(rate_table,
> >  					pll->rate_count *
> >  					sizeof(struct rockchip_pll_rate_table),
> >  					GFP_KERNEL);
> > -		WARN(!pll->rate_table,
> > -			"%s: could not allocate rate table for %s\n",
> > -			__func__, name);
> > +
> > +		/*
> > +		 * Set num rates to 0 if kmemdup fails. That way the clock
> > +		 * at least can report its rate and stays usable.
> > +		 */
> > +		pll->rate_count = pll->rate_table ? len : 0;
> 
> Can an other error handling strategy make sense occasionally?
>
> 
> …
> 		if (!pll->rate_table) {
> 			clk_unregister(mux_clk);
> 			mux_clk = ERR_PTR(-ENOMEM);
> 			goto err_mux;
> 		}
> …
> 
> 
> Would you like to adjust such exception handling another bit?

Nope.

The big difference is that clocks rely heavily on their names to establish
the clock tree parentship. So the PLL cannot work without the name
but can provide some means of functionality without the rate-table
especially as bootloaders do generally initialize a PLL to some form of
sane frequency.

Heiko
