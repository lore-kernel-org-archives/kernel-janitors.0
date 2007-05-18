From: "pradeep singh" <2500.pradeep@gmail.com>
Date: Fri, 18 May 2007 12:35:36 +0000
Subject: [KJ] Re: alloc_netdev() and 32 byte or 32 bit alignment???
Message-Id: <366312910705180523u66b10448vd6d63f516212ba26@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070518141354.9e433fd2.dada1@cosmosbay.com>
In-Reply-To: <20070518141354.9e433fd2.dada1@cosmosbay.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 5/18/07, Eric Dumazet <dada1@cosmosbay.com> wrote:
> On Fri, 18 May 2007 17:10:02 +0530
> "pradeep singh" <2500.pradeep@gmail.com> wrote:
>
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
>
> yes it seems correct
>
> > Why is it 'ensure 32 byte alignment', instead of 32 bit alignment?
>
> Its 32 bytes, not bits.
>
> #define NETDEV_ALIGN        32
> #define NETDEV_ALIGN_CONST  (NETDEV_ALIGN - 1)
>
> >
> > What am i missing here?
>
> I dont know :)
>
> This 32 bytes alignement maybe not up2date, because net_device contains several ____cacheline_aligned_in_smp

Thanks eric
got it.

--psr
>
> Would be nice to switch the alignement to max(L1_CACHE_SIZE, 32) nowadays, at least on SMP
>
>


-- 
play the game
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
