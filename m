From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Fri, 18 May 2007 13:11:24 +0000
Subject: [KJ] Re: alloc_netdev() and 32 byte or 32 bit alignment???
Message-Id: <366312910705180559k55718097hb97ab3845f3fcc7d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070518141354.9e433fd2.dada1@cosmosbay.com>
In-Reply-To: <20070518141354.9e433fd2.dada1@cosmosbay.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/18/07, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Fri, May 18, 2007 at 05:10:02PM +0530, pradeep singh wrote:
> > Hi ,
> >
> > following code snippet is self evident in what it does -
> >
> > truct net_device *alloc_netdev(int sizeof_priv, const char *name,
> >               void (*setup)(struct net_device *))
> > {
> >       void *p;
> >       struct net_device *dev;
> >       int alloc_size;
> >
> >       /* ensure 32-byte alignment of both the device and private area */
> >       alloc_size = (sizeof(*dev) + NETDEV_ALIGN_CONST) & ~NETDEV_ALIGN_CONST;
> >       alloc_size += sizeof_priv + NETDEV_ALIGN_CONST;
> >
> >       p = kzalloc(alloc_size, GFP_KERNEL);
> >       if (!p) {
> >               printk(KERN_ERR "alloc_dev: Unable to allocate device.\n");
> >               return NULL;
> >       }
> > [snip]
> >
> > Is the comment correct?
> > Why is it 'ensure 32 byte alignment', instead of 32 bit alignment?
> >
> > What am i missing here?
>
> Google turned up following useful link:
> http://www.nabble.com/-RFC--changing-value-of-NETDEV_ALIGN-to-cacheline-size-t1620499.html
Thank you Sam.
This is really the answer i should have searched :-(.

A lesson to learn indeed.

Thank you once again.
--psr
>
> snip:
> The reason it's 32 is that old drivers depended on the
> struct being at least 32-byte aligned because they would
> embed structures DMA'd to/from the card in their private
> area and just assumed that would be aligned enough for
> the card's restrictions.
>
>         Sam
>


-- 
play the game
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
