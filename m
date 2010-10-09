From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Sat, 09 Oct 2010 23:16:07 +0000
Subject: Re: [patch] infiniband: uverbs: limit the number of entries
Message-Id: <20101009231607.GA24649@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007071610.GC11681@bicker> <20101007161649.GD21206@obsidianresearch.com> <20101007165947.GD11681@bicker>
In-Reply-To: <20101007165947.GD11681@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Oct 07, 2010 at 06:59:47PM +0200, Dan Carpenter wrote:
> On Thu, Oct 07, 2010 at 10:16:49AM -0600, Jason Gunthorpe wrote:
> > On Thu, Oct 07, 2010 at 09:16:10AM +0200, Dan Carpenter wrote:
> > > If we don't limit cmd.ne then the multiplications can overflow.  This
> > > will allocate a small amount of RAM successfully for the "resp" and
> > > "wc" buffers.  The heap will get corrupted when we call ib_poll_cq().
> > 
> > I think you could cap the number of returned entries to
> > UVERBS_MAX_NUM_ENTRIES rather than return EINVAL. That might be more
> > compatible with user space..
> > 
> 
> Good idea.  I don't actually have this hardware, so I can't test it, but
> that definitely sounds reasonable.

I was just writing some code related to this, and I'm not so sure
anymore. The problem is that the CQ has to be fully drained to properly
synchronize with the edge triggered poll. I was just about to write
a check that assumes it is drained based on returning not equal to
what was requested rather than calling it again and possibly getting 0
back.

I'm wondering if other apps have done something like this? Things
will 'work' but it introduces a subtle race condition with CQ draining
and CQ poll events. 

I guess the ideal thing would be to code this routine to handle
an arbitary count without allocating arbitary memory - by copying
to user space in limited batches.

Jason
