From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 24 Feb 2006 15:26:28 +0000
Subject: Re: [KJ] [Patch] fs/ kzalloc conversions
Message-Id: <20060224152628.GO28587@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71280324418615981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140772454.22453.1.camel@alice> <20060224111755.GA7801@mipter.zuzino.mipt.ru>
In-Reply-To: <20060224111755.GA7801@mipter.zuzino.mipt.ru>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Eric Sesterhenn <snakebyte@gmx.de>, kernel-janitors@lists.osdl.org, linux-fsdevel@vger.kernel.org

--===============71280324418615981==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


[this mail serves two purposes.  One is to educate about the limits of
what a compiler can do, and the other is to alert to a memory-corruption
bug in AIO.  If you're only interested in the latter, please skip to
the bottom.]

On Fri, Feb 24, 2006 at 02:17:55PM +0300, Alexey Dobriyan wrote:
> > @@ -122,10 +122,9 @@ static int aio_setup_ring(struct kioctx
> >  	if (nr_pages > AIO_RING_PAGES) {
> > -		info->ring_pages = kmalloc(sizeof(struct page *) * nr_pages, GFP_KERNEL);
> > +		info->ring_pages = kzalloc(sizeof(struct page *) * nr_pages, GFP_KERNEL);
> >  		if (!info->ring_pages)
> >  			return -ENOMEM;
> > -		memset(info->ring_pages, 0, sizeof(struct page *) * nr_pages);
> >  	}
> 
> I thought, kcalloc should be used here, but after looking at size(1)
> outputs kzalloc wins. Which is slightly suspicious.

Look at the definition of kcalloc:

static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
{
        if (n != 0 && size > INT_MAX / n)
                return NULL;
        return kzalloc(n * size, flags);
}

so you'd be calling kcalloc(nr_pages, sizeof(struct page *), GFP_KERNEL)
which would expand to:

	if (nr_pages > AIO_RING_PAGES) {
		if (nr_pages != 0 && sizeof(struct page *) > INT_MAX / nr_pages)
			info->ring_pages = NULL;
		else
			info->ring_pages = kzalloc(nr_pages * sizeof(struct page *), GFP_KERNEL);

		if (!info->ring_pages)
			return -ENOMEM;
	}

Now, GCC is pretty clever at optimising.  So it probably turns that into:

	if (nr_pages > AIO_RING_PAGES) {
		if (sizeof(struct page *) > INT_MAX / nr_pages)
			return -ENOMEM;
		info->ring_pages = kzalloc(nr_pages * sizeof(struct page *), GFP_KERNEL);
		if (!info->ring_pages)
			return -ENOMEM;
	}

But it can't tell what nr_pages is limited to back in ioctx_alloc().
So it can't optimise away the first test entirely.

[aio-interested readers should pick up again here]

Even if it traces back what nr_pages is limited to (moderately
complicated), it's limited to the global variable aio_max_nr.  Even if
gcc were engaged in whole-program-analysis, it would probably give up
on seeing its address taken in kernel/sysctl.c.  And, at least to this
human's eyes, aio_max_nr actually appears to have *no* limit.

So the test isn't useless and we should use kcalloc here, otherwise an
unthinking sysadmin can increment the aio_max_nr sysctl value to, let's
say, 0x7fffffff.  On a 32-bit machine, the multiplication will wrap,
maybe turn into a small positive number, and we'll gleefully walk off
the end of the array, corrupting data as we go.

And we should set the .extra1 and .extra2 values in the FS_AIO_MAX_NR
clause of kernel/sysctl.c anyway.  Does anyone have thoughts on what the 
*useful* range of this variable is?

--===============71280324418615981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71280324418615981==--
