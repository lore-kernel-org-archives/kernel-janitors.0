From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Thu, 07 Oct 2010 16:16:49 +0000
Subject: Re: [patch] infiniband: uverbs: limit the number of entries
Message-Id: <20101007161649.GD21206@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007071610.GC11681@bicker>
In-Reply-To: <20101007071610.GC11681@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Oct 07, 2010 at 09:16:10AM +0200, Dan Carpenter wrote:
> If we don't limit cmd.ne then the multiplications can overflow.  This
> will allocate a small amount of RAM successfully for the "resp" and
> "wc" buffers.  The heap will get corrupted when we call ib_poll_cq().

I think you could cap the number of returned entries to
UVERBS_MAX_NUM_ENTRIES rather than return EINVAL. That might be more
compatible with user space..

Jason
