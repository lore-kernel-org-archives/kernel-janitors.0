From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2021 15:34:56 +0000
Subject: Re: [PATCH][next] nfsd: fix check of statid returned from call to find_stateid_by_type
Message-Id: <20210128153456.GI2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128144935.640026-1-colin.king@canonical.com>
 <793C88A3-B117-4138-B74A-845E0BD383C9@oracle.com>
In-Reply-To: <793C88A3-B117-4138-B74A-845E0BD383C9@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Bruce Fields <bfields@fieldses.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2021 at 03:05:06PM +0000, Chuck Lever wrote:
> Hi Colin-
> 
> > On Jan 28, 2021, at 9:49 AM, Colin King <colin.king@canonical.com> wrote:
> > 
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The call to find_stateid_by_type is setting the return value in *stid
> > yet the NULL check of the return is checking stid instead of *stid.
> > Fix this by adding in the missing pointer * operator.
> > 
> > Addresses-Coverity: ("Dereference before null check")
> > Fixes: 6cdaa72d4dde ("nfsd: find_cpntf_state cleanup")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks for your patch. I've committed it to the for-next branch at
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git
> 
> in preparation for the v5.12 merge window, with the following changes:
> 
> - ^statid^stateid
> - Fixes: tag removed, since no stable backport is necessary
> 
> The commit you are fixing has not been merged upstream yet.

Fixes tags don't meant the patch has to be backported.  Is your tree
rebased?  In that case, the fixes tag probably doesn't make sense
because the tag can change.  You might want to just consider folding
Colin's fix into the original commit.

Fixes tags are used for a lot of different things:
1)  If there is a fixes tag, then you can tell it does *NOT* have to
    be back ported because the original commit is not in the stable
    tree.  It saves time for the stable maintainers.
2)  Metrics to figure out how quickly we are fixing bugs.
3)  Sometimes the Fixes tag helps because we want to review the original
    patch to see what the intent was.

All sorts of stuff.  Etc.

regards,
dan carpenter
