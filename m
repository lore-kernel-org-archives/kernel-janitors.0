From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Wed, 24 Nov 2010 22:18:45 +0000
Subject: Re: [patch v4] infiniband: uverbs: handle large number of entries
Message-Id: <20101124221845.GH2369@obsidianresearch.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007071610.GC11681@bicker>
 <20101007161649.GD21206@obsidianresearch.com>
 <20101007165947.GD11681@bicker>
 <20101009231607.GA24649@obsidianresearch.com>
 <20101012113117.GB6742@bicker>
 <20101012210118.GR24268@obsidianresearch.com>
 <20101013091312.GB6060@bicker>
 <20101123071025.GI1522@bicker>
 <adahbf6gytv.fsf@cisco.com>
In-Reply-To: <adahbf6gytv.fsf-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Nov 24, 2010 at 02:07:40PM -0800, Roland Dreier wrote:
 
>  - Fixing the potential integer overflow by capping cmd.ne at some high
>    but safe value (1000 say)

This breaks how userspace wants to use poll, ie if you return anything
less than what I asked for then that means there is no more work to
do. Apps make this assumption, and is a reasonable thing to
do. Otherwise apps need a dummy call to ibv_poll to avoid races.

So if you are worried about how many times ib_poll_cq is called then
bound the kzalloc size and wrap the whole thing in a loop, but
realistically I have to think the performance trade off of
kzalloc/free vs calling ib_poll more often is not entirely obvious.

Who uses this path anyhow?

Jason
