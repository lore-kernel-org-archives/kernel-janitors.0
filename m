From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 01 Nov 2006 23:22:04 +0000
Subject: Re: [KJ] atomic variables and "volatility"
Message-Id: <Pine.LNX.4.64.0611011821540.7463@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0611011355080.5454@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0611011355080.5454@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 1 Nov 2006, Jesper Juhl wrote:

> On 01/11/06, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> >   since i'm getting the impression that the LKML is not the right
> > place for discussions like this, i'm going to move it to the KJ list.
> >
> >   i'm curious about possible redundancy or confusing code in the
> > numerous atomic.h header files that define atomic variables for each
> > architecture.  the first issue is that there are two different
> > typedefs for an "atomic_t" depending on the architecture -- one of:
> >
> >         typedef struct { int counter; } atomic_t;
> >         typedef struct { volatile int counter; } atomic_t;
> >                          ^^^^^^^^
> >
>
> There was a long thread recently on LKML about volatile - it's
> interresting, I suggest you read it. Especially this post by Linus
> is worth reading : http://lkml.org/lkml/2006/7/6/159
>
> Reading the entire thread should give you a clearer picture.  :-)

thanks, i'll check it out.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
