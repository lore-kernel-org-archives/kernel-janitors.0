From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Nov 2010 07:10:25 +0000
Subject: Re: [patch v4] infiniband: uverbs: handle large number of entries
Message-Id: <20101123071025.GI1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101007071610.GC11681@bicker>
 <20101007161649.GD21206@obsidianresearch.com>
 <20101007165947.GD11681@bicker>
 <20101009231607.GA24649@obsidianresearch.com>
 <20101012113117.GB6742@bicker>
 <20101012210118.GR24268@obsidianresearch.com>
 <20101013091312.GB6060@bicker>
In-Reply-To: <20101013091312.GB6060@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Oct 13, 2010 at 11:13:12AM +0200, Dan Carpenter wrote:
> In the original code there was a potential integer overflow if you
> passed in a large cmd.ne.  The calls to kmalloc() would allocate smaller
> buffers than intended, leading to memory corruption. There was also an 
> information leak if resp wasn't all used.
> 
> Documentation/infiniband/user_verbs.txt suggests this function is meant
> for unprivileged access.
> 
> Special thanks to Jason Gunthorpe for his help and advice.
> 

Crap!  Apparently c99 initialization zeroes out the holes most of the
time but not all the time.

http://lkml.org/lkml/2010/11/22/367

I'm still waiting for some GCC people to chime in about what the rules
are here, but it looks like I may need to add memsets to this patch.

regards,
dan carpenter


