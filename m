From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Apr 2013 18:46:47 +0000
Subject: Re: build regressions 2013-04-12
Message-Id: <20130412184647.GD6638@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <516844ac.FQynwILU0vkREm5c%fengguang.wu@intel.com>
In-Reply-To: <516844ac.FQynwILU0vkREm5c%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Apr 13, 2013 at 01:30:20AM +0800, Fengguang Wu wrote:
> [smatch]
> net/9p/trans_rdma.c:511 rdma_request() warn: inconsistent returns sem:&rdma->sq_sem: locked (497 [s32min-s32max]) unlocked (501 [(-5)], 511 [0], 511 [s32min-(-1),1-s32max], 511 [0])

These are not actually new warnings, I've just changed it to
include the return values.

So in net/9p/trans_rdma.c on line 497 then we don't know the return
value.  This is because it is:

	return qp->device->post_send(qp, send_wr, bad_send_wr);

and Smatch only knows is that it is returning an in.

Line 501 is "return -EIO;" which is -5.

According to your output line 511 can return 3 different things:

	zero, non-zero, or zero.

Why does it say we are returning zero on this error path?  And why
doesn't it list the -ENOMEM (-12) returns?  I can't reproduce this
on my system so I'm not sure.  It could be that I have fixed a
Smatch bug but not pushed it yet, or it could be a bug in the
kernel you are testing.

On my system, the database has slightly more data so initialy it
didn't try to break the return values appart on line 511.  It just
said that it returned non-zero.  I have an idea that we can actually
break about the return here without hurting performance.

With that change applied it now says:

	"511 [(-12)], 511 [s32min-(-1),1-s32max], 511 [(-12)], 511 [(-12)]"

In otherwords there are 3 paths where we set "err = -ENOMEM;" and
one where error is a non-zero error code.

I think maybe this output is too noisy and not useful.  What do you
guys think?  I could change it back.

The main thing is that check_locking.c has fewer false positives
now.

regards,
dan carpenter

