From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 11 Feb 2021 07:39:06 +0000
Subject: Re: [PATCH][next] soc: xilinx: vcu: remove deadcode on null divider check
Message-Id: <20210211073906.GC30300@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210184938.146124-1-colin.king@canonical.com>
 <161301409895.1254594.6980739457487251623@swboyd.mtv.corp.google.com>
In-Reply-To: <161301409895.1254594.6980739457487251623@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, Colin King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, 10 Feb 2021 19:28:18 -0800, Stephen Boyd wrote:
> Quoting Colin King (2021-02-10 10:49:38)
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The pointer 'divider' has previously been null checked followed by
> > a return, hence the subsequent null check is redundant deadcode
> > that can be removed.  Clean up the code and remove it.
> > 
> > Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/clk/xilinx/xlnx_vcu.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
> > index d66b1315114e..607936d7a413 100644
> > --- a/drivers/clk/xilinx/xlnx_vcu.c
> > +++ b/drivers/clk/xilinx/xlnx_vcu.c
> > @@ -512,9 +512,6 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> >  
> >         mux = clk_hw_get_parent(divider);
> >         clk_hw_unregister_mux(mux);
> > -       if (!divider)
> > -               return;
> > -
> 
> This code is pretty confusing. Waiting for m.tretter@pengutronix.de to
> reply

Can you elaborate what you find confusing about this code. I would gladly try
to clarify and improve the code.

What happens here is that the driver registers a mux -> divider -> gate chain
for each output clock, but only stores the gate clock. When unregistering the
clocks, the driver starts at the gate and walks up to the mux while
unregistering the clocks.

Michael

> 
> >         clk_hw_unregister_divider(divider);
> >  }
> >
> 
