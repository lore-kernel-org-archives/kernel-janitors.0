From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2019 14:49:21 +0000
Subject: Re: [PATCH -next] nfsd: Drop LIST_HEAD where the variable it declares is never used.
Message-Id: <20191101144921.GA10409@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191101114054.50225-1-maowenan@huawei.com>
 <7E1B5E17-FF35-472B-8316-D4C01085BAE4@oracle.com>
In-Reply-To: <7E1B5E17-FF35-472B-8316-D4C01085BAE4@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Lever <chuck.lever@oracle.com>
Cc: Mao Wenan <maowenan@huawei.com>, Bruce Fields <bfields@redhat.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Dros Adamson <dros@primarydata.com>, jeff.layton@primarydata.com, richard.sharpe@primarydata.com, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 01, 2019 at 09:36:27AM -0400, Chuck Lever wrote:
> Hi Mao-
> 
> > On Nov 1, 2019, at 7:40 AM, Mao Wenan <maowenan@huawei.com> wrote:
> > 
> > The declarations were introduced with the file, but the declared
> > variables were not used.
> > 
> > Fixes: 65294c1f2c5e ("nfsd: add a new struct file caching facility to nfsd")
> 
> I'm not sure a Fixes: tag is necessary here? 65294c1f2c5e
> works fine without this change, and it's not something we
> would need to backport into stable kernels.
> 
> This is more of a clean up patch.
> 

Fixes is not really related to backports or stable.  I would agree that
this isn't a bug but just a cleanup, but the problem is that other
people want Fixes tags for everything...

Yesterday I sent a cleanup patch and I almost put the Fixes tag under
the --- cut off but in the end I just deleted it...  It's hard to know
what the right thing is.

regards,
dan carpenter
