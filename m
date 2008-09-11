From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Sep 2008 08:36:18 +0000
Subject: Re: code after return
Message-Id: <Pine.LNX.4.64.0809111035320.9593@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0808312231550.5157@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0808312231550.5157@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

For concreteness, here is one example (extra break in the default case):

	switch (init_attr->qp_type) {
	case IB_QPT_RC:
		qp = kzalloc(sizeof(*qp), GFP_KERNEL);
		if (!qp) {
			pr_debug("%s: Unable to allocate QP\n", __func__);
			return ERR_PTR(-ENOMEM);
		}
		spin_lock_init(&qp->lock);
		if (pd->uobject) {
			/* userspace specific */
		}

		err = c2_alloc_qp(to_c2dev(pd->device),
				  to_c2pd(pd), init_attr, qp);

		if (err && pd->uobject) {
			/* userspace specific */
		}

		break;
	default:
		pr_debug("%s: Invalid QP type: %d\n", __func__,
			init_attr->qp_type);
		return ERR_PTR(-EINVAL);
		break;
	}

julia



On Thu, 11 Sep 2008, vignesh babu bm wrote:

> The given example doesnt really need break statements...
> 
> On Thu, Sep 11, 2008 at 1:56 PM, Richard Genoud
> <richard.genoud@gmail.com> wrote:
> >
> > 2008/8/31 Julia Lawall <julia@diku.dk>:
> > > Below is a list of some places (file and function name) where there is
> > > some code after a return or goto.  Most of the time, the return is in a
> > > switch case, and the code after the return is a break.  I was wondering
> > > whether it would be useful to do something about these?  Or is the thought
> > > that it has no impact on the compiled code, so it doesn't matter?  Or is
> > > it actually desirable to have a break in every switch case, even if it
> > > amounts to dead code?
> > >
> > > thanks,
> > > julia
> >
> > IHMO, those breaks (and the superfluous semicolon) should be removed.
> > In the CodingStlye document there's a switch/case example (actually,
> > it was a placing braces example) like that :
> >
> > switch (action) {
> > case KOBJ_ADD:
> >        return "add";
> > case KOBJ_REMOVE:
> >        return "remove";
> > case KOBJ_CHANGE:
> >        return "change";
> > default:
> >        return NULL;
> > }
> > So, it seems that there's no rule like having a break in every switch case.
> >
> > Anyone, another opinion ?
> >
> > richard.
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> --
> ----------------------------------------------
> "Why is it that every time I'm with you, makes me believe in magic?"
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
