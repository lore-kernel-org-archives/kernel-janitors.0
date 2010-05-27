From: Nicolas Palix <npalix@diku.dk>
Date: Thu, 27 May 2010 11:48:30 +0000
Subject: Re: [PATCH 4/4] Add scripts/coccinelle/resource_size.cocci
Message-Id: <201005271348.31452.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk> <1273508667-5152-5-git-send-email-npalix@diku.dk> <o2y84144f021005100952z1a7e991dt21341fb8f7c76af@mail.gmail.com>
In-Reply-To: <o2y84144f021005100952z1a7e991dt21341fb8f7c76af@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Monday 10 May 2010 18:52:10 Pekka Enberg wrote:
> On Mon, May 10, 2010 at 7:24 PM, Nicolas Palix <npalix@diku.dk> wrote:
> > @@ -0,0 +1,94 @@
> > +///
> > +/// Use resource_size function on resource object
> > +/// instead of explicit computation.
> > +///
> > +//  Confidence: High
> > +//  Copyright: (C) 2009, 2010 Nicolas Palix, DIKU.  GPLv2.
> > +//  Copyright: (C) 2009, 2010 Julia Lawall, DIKU.  GPLv2.
> > +//  Copyright: (C) 2009, 2010 Gilles Muller, INRIA/LiP6.  GPLv2.
> > +//  URL: http://coccinelle.lip6.fr/
> > +//  Options:
> > +//
> > +//  Keywords: resource_size
> > +//  Version min: 2.6.27 resource_size
> 
> I guess we don't need this versioning in mainline?
> 

It's indeed not essential for the mainline. It's however
helpful to document the internal APIs and will help people
who want to (back)port this patch series on other branches,
potentially branches forked before 2.6.27 for instance.

-- 
Nicolas Palix
