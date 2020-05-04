From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 04 May 2020 19:28:38 +0000
Subject: Re: question about lists
Message-Id: <alpine.DEB.2.21.2005042128110.13990@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.2005032308500.2533@hadrien>
In-Reply-To: <alpine.DEB.2.21.2005032308500.2533@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Mon, 4 May 2020, Dan Carpenter wrote:

> On Sun, May 03, 2020 at 11:10:01PM +0200, Julia Lawall wrote:
> > Hello,
> >
> > I was wondering what is the point of code like the following:
> >
> >         INIT_LIST_HEAD(&bb->list);
> >         list_add(&bb->list, &s->workload->shadow_bb);
> >
> > As far as I can see, list_add will initialize both fields of the list_head
> > structure without looking at their values, so why is the INIT_LIST_HEAD
> > needed?
>
> Yeah.  You're right.  It's not needed.

OK, there seem to be a good number of them, so I wondered if I missed
something.

thanks,
julia
