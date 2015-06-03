From: Michael Turquette <mturquette@linaro.org>
Date: Wed, 03 Jun 2015 23:21:41 +0000
Subject: Re: [patch] clk: socfpga: remove a stray tab
Message-Id: <20150603232141.6017.18339@quantum>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150527082627.GD19423@mwanda> <5565C4F4.7090805@opensource.altera.com>
In-Reply-To: <5565C4F4.7090805@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinh Nguyen <dinguyen@opensource.altera.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Dinh Nguyen (2015-05-27 06:21:56)
> 
> 
> On 5/27/15 3:26 AM, Dan Carpenter wrote:
> > This line was indented too far.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
> > index be3e998..83c6780 100644
> > --- a/drivers/clk/socfpga/clk-gate-a10.c
> > +++ b/drivers/clk/socfpga/clk-gate-a10.c
> > @@ -39,7 +39,7 @@ static unsigned long socfpga_gate_clk_recalc_rate(struct clk_hw *hwclk,
> >       else if (socfpgaclk->div_reg) {
> >               val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
> >               val &= div_mask(socfpgaclk->width);
> > -                     div = (1 << val);
> > +             div = (1 << val);
> >       }
> >  
> >       return parent_rate / div;
> > 
> 
> Acked-by: Dinh Nguyen <dinguyen@opensource.altera.com>

Applied.

Regards,
Mike
