From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 01 Jan 2020 19:23:24 +0000
Subject: Re: [PATCH 02/10] ALSA: ml403-ac97cr: use resource_size
Message-Id: <alpine.DEB.2.21.2001012022380.3262@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
 <s5hmub72dh3.wl-tiwai@suse.de>
In-Reply-To: <s5hmub72dh3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 1 Jan 2020, Takashi Iwai wrote:

> On Wed, 01 Jan 2020 18:49:42 +0100,
> Julia Lawall wrote:
> >
> > Use resource_size rather than a verbose computation on
> > the end and start fields.
> >
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > <smpl>
> > @@ struct resource *ptr; @@
> > - ((ptr->end) - (ptr->start) + 1)
> > + resource_size(ptr)
> > </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> Unfortunately this doesn't apply cleanly on my tree.  I guess you
> worked on linux-next which contains a change outside the sound git
> tree that converts ioremap_nocache() to ioremap().
>
> We may apply it in sound git tree and let conflicts resolved at the
> merge time.  OTOH, it's no urgent fix at all and can be postponed
> after 5.6-rc1 merge, too -- then everything can be applied in a
> cleaner way.
>
> Let me know your preference.

It's from linux-next.  No hurry.  Postponing it is fine.

thanks,
julia
