From: Bruce Fields <bfields@fieldses.org>
Date: Thu, 28 Jan 2021 18:50:42 +0000
Subject: Re: [PATCH][next] nfsd: fix check of statid returned from call to find_stateid_by_type
Message-Id: <20210128185042.GB29887@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128144935.640026-1-colin.king@canonical.com>
 <793C88A3-B117-4138-B74A-845E0BD383C9@oracle.com>
 <20210128153456.GI2696@kadam>
 <80ACEDFA-B496-44E0-AABB-BD4A7826516B@oracle.com>
In-Reply-To: <80ACEDFA-B496-44E0-AABB-BD4A7826516B@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2021 at 03:53:36PM +0000, Chuck Lever wrote:
> > On Jan 28, 2021, at 10:34 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Fixes tags are used for a lot of different things:
> > 1)  If there is a fixes tag, then you can tell it does *NOT* have to
> >    be back ported because the original commit is not in the stable
> >    tree.  It saves time for the stable maintainers.
> > 2)  Metrics to figure out how quickly we are fixing bugs.
> > 3)  Sometimes the Fixes tag helps because we want to review the original
> >    patch to see what the intent was.
> > 
> > All sorts of stuff.  Etc.
> 
> Yep, I'm a fan of all that. I just want to avoid poking the stable
> automation bear when it's unnecessary.

I've routinely had patches with Fixes: lines referencing other queued-up
patches, and I didn't get any stable mail about it.

100% not something to worry about.

--b.
