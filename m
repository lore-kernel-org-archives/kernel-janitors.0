From: Fengguang Wu <wfg@linux.intel.com>
Date: Sat, 22 Sep 2012 11:49:34 +0000
Subject: Re: [ux500:preview-for-next 26/62] kernel/irq/irqdomain.c:331:2: error: implicit declaration of func
Message-Id: <20120922114934.GA14957@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921234833.GA5959@localhost>
In-Reply-To: <20120921234833.GA5959@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Lee,

On Sat, Sep 22, 2012 at 01:43:19PM +0200, Lee Jones wrote:
> It would be better if you didn't test any of them from that tree, as there
> could be anything in them.
> 
> Anything that is going upstream will be in the upstream maintainer's -next
> branches.
> 
> Please test these instead.

The maintainer's -next trees often cannot be rebased when errors
are found there. That's the reason I try to test commits earlier in
the individual developers' trees.

However if you still prefer it, I can remove your tree from auto tests.

Thanks,
Fengguang

> On 22 September 2012 01:48, Fengguang Wu <wfg@linux.intel.com> wrote:
> 
> > Hi Lee,
> >
> > I'm simply testing every branches that can be found. Are there some
> > branches in your tree not suitable for testing? If so, I can add them
> > to the opt-out list.
> >
> > Thanks,
> > Fengguang
> >
> >
> > On Fri, Sep 21, 2012 at 05:13:51PM +0200, Lee Jones wrote:
> > > Hmm... just of out interest, why are you using that branch?
> > >
> > > Kind regards,
> > > Lee
> > >
> > > On 21 September 2012 03:59, Yuanhan Liu <yuanhan.liu@intel.com> wrote:
> > >
> > > > Hi Lee,
> > > >
> > > > FYI, kernel build failed on
> > > >
> > > > tree:   git://
> > git.linaro.org/people/ljones/linux-3.0-ux500.gitpreview-for-next
> > > > head:   3cc064be4244a038bbbd303ce18b78e06b5fd508
> > > > commit: 04939876856788a50902e273c260d922001d32fe [26/62] Revert
> > "of/irq:
> > > > Create stub for of_irq_find_parent when !CONFIG_OF"
> > > > config: x86_64-allyesdebian (attached as .config)
> > > >
> > > > All related error/warning messages:
> > > >
> > > > kernel/irq/irqdomain.c: In function 'irq_find_host':
> > > > kernel/irq/irqdomain.c:331:2: error: implicit declaration of function
> > > > 'of_irq_find_parent' [-Werror=implicit-function-declaration]
> > > > kernel/irq/irqdomain.c:331:14: warning: assignment makes pointer from
> > > > integer without a cast [enabled by default]
> > > > cc1: some warnings being treated as errors
> > > >
> > > > vim +331 kernel/irq/irqdomain.c
> > > >    325  {
> > > >    326          struct irq_domain *h, *found = NULL;
> > > >    327          struct device_node *parent_node;
> > > >    328          int rc;
> > > >    329
> > > >    330          /* Take heed if an 'interrupt-parent' was specified. */
> > > >  > 331          parent_node = of_irq_find_parent(node);
> > > >    332          if (parent_node)
> > > >    333                  node = parent_node;
> > > >    334
> > > >
> > > > -------
> > > > I do see that the following commit: 446f1bfe(Revert "irqdomain:.*")
> > would
> > > > fix
> > > > this build error. But this commit break the bisectabilty. And I guess
> > this
> > > > issue
> > > > can be fixed by reverse the revert order: 446f1bfe(Revert "of/irq:.*")
> > and
> > > > then
> > > > 04939876(Revert "irqdomain:.*").
> > > >
> > > > ---
> > > > 0-DAY kernel build testing backend         Open Source Technology
> > Centre
> > > > Fengguang Wu, Yuanhan Liu                              Intel
> > Corporation
> > > >
> > >
> > >
> > >
> > > --
> > > Lee Jones
> > > Linaro ST-Ericsson Landing Team Lead
> > > Linaro.org │ Open source software for ARM SoCs
> > > Follow Linaro: Facebook | Twitter | Blog
> >
> 
> 
> 
> -- 
> Lee Jones
> Linaro ST-Ericsson Landing Team Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
