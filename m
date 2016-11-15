From: atull <atull@opensource.altera.com>
Date: Tue, 15 Nov 2016 16:01:47 +0000
Subject: Re: [patch] ARM: socfpga: checking the wrong variable
Message-Id: <alpine.DEB.2.20.1611151000280.3634@atull-VirtualBox2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161115095433.GD15424@mwanda> <CAAtXAHc9zFhGm-BNWX-wSzZWujD7fpgnd7s2gr88Hm5B5613wQ@mail.gmail.com>
In-Reply-To: <CAAtXAHc9zFhGm-BNWX-wSzZWujD7fpgnd7s2gr88Hm5B5613wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Tue, 15 Nov 2016, Moritz Fischer wrote:

> Hi Dan,
> On Tue, Nov 15, 2016 at 1:54 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This is a cut and paste bug.  We had intended to check "sysmgr".
> >
> > Fixes: e5f8efa5c8bf ("ARM: socfpga: fpga bridge driver support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>

Hi Dan,

Acked-by: Alan Tull <atull@opensource.altera.com>

Thanks for catching this!

Alan

> 
> >
> > diff --git a/drivers/fpga/altera-fpga2sdram.c b/drivers/fpga/altera-fpga2sdram.c
> > index 7ab358e..d4eeb74 100644
> > --- a/drivers/fpga/altera-fpga2sdram.c
> > +++ b/drivers/fpga/altera-fpga2sdram.c
> > @@ -123,7 +123,7 @@ static int alt_fpga_bridge_probe(struct platform_device *pdev)
> >         }
> >
> >         sysmgr = syscon_regmap_lookup_by_compatible("altr,sys-mgr");
> > -       if (IS_ERR(priv->sdrctl)) {
> > +       if (IS_ERR(sysmgr)) {
> >                 dev_err(dev, "regmap for altr,sys-mgr lookup failed.\n");
> >                 return PTR_ERR(sysmgr);
> >         }
> 
> Thanks,
> 
> Moritz
> 
