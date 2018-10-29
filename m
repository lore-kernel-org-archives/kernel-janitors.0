From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 29 Oct 2018 09:34:00 +0000
Subject: Re: [PATCH 2/8] ARM: vexpress/spc: constify clk_ops structure
Message-Id: <alpine.DEB.2.20.1810291033270.3755@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1340634172-1540805640=:3755"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540619262-22681-3-git-send-email-Julia.Lawall@lip6.fr>
 <20181029091756.GA1167@e110455-lin.cambridge.arm.com>
In-Reply-To: <20181029091756.GA1167@e110455-lin.cambridge.arm.com>
To: linux-arm-kernel@lists.infradead.org

--8323329-1340634172-1540805640=:3755
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 29 Oct 2018, Liviu Dudau wrote:

> On Sat, Oct 27, 2018 at 07:47:36AM +0200, Julia Lawall wrote:
> > The clk_ops structure is only stored in the ops field of a
> > clk_init_data structure.  This field is const, so the clk_ops
> > structure can be const as well.
> >
> > Identified and transformed using Coccinelle.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
> Are you going to send the series to the arm-soc maintainers directly or
> you want us to cherry-pick this patch into the Versatile tree?

Please do with it whatever seems best.

Thanks,
julia

>
> Best regards,
> Liviu
>
> >
> > ---
> >  arch/arm/mach-vexpress/spc.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-vexpress/spc.c b/arch/arm/mach-vexpress/spc.c
> > index 0f5381d13494..611f22de48cb 100644
> > --- a/arch/arm/mach-vexpress/spc.c
> > +++ b/arch/arm/mach-vexpress/spc.c
> > @@ -521,7 +521,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
> >  	return ve_spc_set_performance(spc->cluster, rate / 1000);
> >  }
> >
> > -static struct clk_ops clk_spc_ops = {
> > +static const struct clk_ops clk_spc_ops = {
> >  	.recalc_rate = spc_recalc_rate,
> >  	.round_rate = spc_round_rate,
> >  	.set_rate = spc_set_rate,
> >
>
> --
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯
>
--8323329-1340634172-1540805640=:3755--
