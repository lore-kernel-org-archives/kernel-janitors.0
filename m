From: Bruce Fields <bfields@fieldses.org>
Date: Thu, 28 Jan 2021 15:17:15 +0000
Subject: Re: [PATCH][next] nfsd: fix check of statid returned from call to find_stateid_by_type
Message-Id: <20210128151715.GA29887@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128144935.640026-1-colin.king@canonical.com>
 <793C88A3-B117-4138-B74A-845E0BD383C9@oracle.com>
In-Reply-To: <793C88A3-B117-4138-B74A-845E0BD383C9@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

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

Please keep the "Fixes:" tag!  It's still very useful information.  For
example, if someone needs to backport the original patch, this is a
reminder they'll want this one as well.

(Of course, if you fold this patch into the earlier one instead, that's
a different situation.)

--b.

> The commit you are fixing has not been merged upstream yet.
> 
> 
> > ---
> > fs/nfsd/nfs4state.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> > index f554e3480bb1..423fd6683f3a 100644
> > --- a/fs/nfsd/nfs4state.c
> > +++ b/fs/nfsd/nfs4state.c
> > @@ -5824,7 +5824,7 @@ static __be32 find_cpntf_state(struct nfsd_net *nn, stateid_t *st,
> > 
> > 	*stid = find_stateid_by_type(found, &cps->cp_p_stateid,
> > 			NFS4_DELEG_STID|NFS4_OPEN_STID|NFS4_LOCK_STID);
> > -	if (stid)
> > +	if (*stid)
> > 		status = nfs_ok;
> > 	else
> > 		status = nfserr_bad_stateid;
> > -- 
> > 2.29.2
> > 
> 
> --
> Chuck Lever
> 
> 
