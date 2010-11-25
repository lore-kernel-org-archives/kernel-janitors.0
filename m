From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Thu, 25 Nov 2010 04:13:37 +0000
Subject: Re: [patch v4] infiniband: uverbs: handle large number of entries
Message-Id: <20101125041337.GA11049@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007161649.GD21206@obsidianresearch.com> <20101007165947.GD11681@bicker> <20101009231607.GA24649@obsidianresearch.com> <20101012113117.GB6742@bicker> <20101012210118.GR24268@obsidianresearch.com> <20101013091312.GB6060@bicker> <20101123071025.GI1522@bicker> <adahbf6gytv.fsf@cisco.com> <20101124221845.GH2369@obsidianresearch.com> <adad3pugi90.fsf@cisco.com>
In-Reply-To: <adad3pugi90.fsf-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Nov 24, 2010 at 08:05:47PM -0800, Roland Dreier wrote:

>  > So if you are worried about how many times ib_poll_cq is called then
>  > bound the kzalloc size and wrap the whole thing in a loop, but
>  > realistically I have to think the performance trade off of
>  > kzalloc/free vs calling ib_poll more often is not entirely obvious.
> 
> That's true... maybe doing things one at a time but avoiding the allocs
> is the right tradeoff.

Hmm, considering your list is everything but Mellanox, maybe it makes
much more sense to push the copy_to_user down into the driver - 
ie a ibv_poll_cq_user - then the driver can construct each CQ entry on
the stack and copy it to userspace, avoid the double copy, allocation
and avoid any fixed overhead of ibv_poll_cq.

A bigger change to be sure, but remember this old thread:

http://www.mail-archive.com/linux-rdma@vger.kernel.org/msg05114.html

2x improvement by removing allocs on the post path..

Jason
