From: "J. Bruce Fields" <bfields@redhat.com>
Date: Fri, 01 Nov 2019 15:51:06 +0000
Subject: Re: [PATCH -next] nfsd: Drop LIST_HEAD where the variable it declares is never used.
Message-Id: <20191101155106.GA30730@pick.fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101114054.50225-1-maowenan@huawei.com>
 <7E1B5E17-FF35-472B-8316-D4C01085BAE4@oracle.com>
 <20191101144921.GA10409@kadam>
In-Reply-To: <20191101144921.GA10409@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Mao Wenan <maowenan@huawei.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Dros Adamson <dros@primarydata.com>, jeff.layton@primarydata.com, richard.sharpe@primarydata.com, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 01, 2019 at 05:49:21PM +0300, Dan Carpenter wrote:
> On Fri, Nov 01, 2019 at 09:36:27AM -0400, Chuck Lever wrote:
> > > On Nov 1, 2019, at 7:40 AM, Mao Wenan <maowenan@huawei.com> wrote:
> > > 
> > > The declarations were introduced with the file, but the declared
> > > variables were not used.
> > > 
> > > Fixes: 65294c1f2c5e ("nfsd: add a new struct file caching facility to nfsd")

Thanks, applying for 5.5.

> > I'm not sure a Fixes: tag is necessary here? 65294c1f2c5e
> > works fine without this change, and it's not something we
> > would need to backport into stable kernels.
> > 
> > This is more of a clean up patch.
> > 
> 
> Fixes is not really related to backports or stable.  I would agree that
> this isn't a bug but just a cleanup, but the problem is that other
> people want Fixes tags for everything...
> 
> Yesterday I sent a cleanup patch and I almost put the Fixes tag under
> the --- cut off but in the end I just deleted it...  It's hard to know
> what the right thing is.

It doesn't have a stable cc and it's pretty obvious cleanup, so I guess
there's no harm in it.

I could go either way.  But I'll leave the patch as is unless someone
comes up with a clear policy.

--b.
