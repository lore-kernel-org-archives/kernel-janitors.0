From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 10:28:28 +0000
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
Message-Id: <20200923102828.GH18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200923084458.GD1454948@mwanda>
 <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
In-Reply-To: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 23, 2020 at 11:10:17AM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Wed, Sep 23, 2020 at 10:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This code needs to call iounmap() on the error paths.
> 
> Thanks for your patch!
> 
> > Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")
> 
> This is not the commit that introduced the issue.

Duh...  I don't know what I was thinking there.

> 
> Fixes: 2173fc7cb681c38b ("ARM: shmobile: R-Mobile: Add DT support for
> PM domains")
> 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> > --- a/drivers/soc/renesas/rmobile-sysc.c
> > +++ b/drivers/soc/renesas/rmobile-sysc.c
> > @@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
> >                 pmd = of_get_child_by_name(np, "pm-domains");
> >                 if (!pmd) {
> >                         pr_warn("%pOF lacks pm-domains node\n", np);
> > +                       iounmap(base);
> 
> This one I can agree with, although that case is a bug in the DTS.
> 
> >                         continue;
> >                 }
> >
> > @@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
> >                 of_node_put(pmd);
> >                 if (ret) {
> >                         of_node_put(np);
> > +                       iounmap(base);
> 
> This one I cannot: in the (unlikely, only if OOM) case
> rmobile_add_pm_domains() returns an error, one or more PM subdomains may
> have been registered already.  Hence if you call iounmap() here, the
> code will try to access unmapped registers later, leading to a crash.
> 

It's actually impossible for this rmobile_add_pm_domains() to fail on
current kernels because small allocations never fail...

I'll send a v2.  This is for a new static checker test that I added to
Smatch so I'm just sending a few of these out every day to collect
feedback for now.  So thanks for reviewing this, it's very helpful.

regards,
dan carpenter
