From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 22 Feb 2006 23:55:22 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <9a8748490602221555i5e73f4fo9edcfb52822c9d1a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/22/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Wed, Feb 22, 2006 at 01:14:39AM +0100, Jesper Juhl wrote:
> > On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > > On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> > > > This looks broken - did you even compile test that patch?
> > > >
> > > > Don't you mean :
> > > >
> > > > return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
> > >
> > > *yuck*, sorry for this, didnt compile test since it doesnt build
> > > with my config. fixed patch below.
> > >
> >
> > Hmm, a simple
> >
> > $ make allyesconfig
> > $ make fs/proc/kcore.o
>
> How on earth did this succeed? I always, always get
>
[snip build failure]
>
> Some secret agreement with devil you've signed?
>

I took a second look at my tree and it turns out I did a previous

$ make allyesconfig
$ make

in there. I'd completely forgotten to clean it first, I just deleted
the .o file, so what I actually did turns out to be:

$ make allyesconfig
$ make
$ rm fs/proc/kcore.o
$ make allyesconfig
$ make fs/proc/kcore.o


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
