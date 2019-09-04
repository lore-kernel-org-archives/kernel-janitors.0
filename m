From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 12:44:24 +0000
Subject: Re: [PATCH] f2fs: signedness bug in f2fs_fname_setup_ci_filename()
Message-Id: <20190904124424.GA3115@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904100239.GC7007@mwanda>
 <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
In-Reply-To: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Yu <yuchao0@huawei.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On Wed, Sep 04, 2019 at 07:43:07PM +0800, Chao Yu wrote:
> On 2019/9/4 18:02, Dan Carpenter wrote:
> > The error handling doesn't work because "cf_name->len" is unsigned.
> 
> Dan, thanks for catching this, would you mind merging this into original patch,
> since it's still in the dev branch. :)

I don't mind if you fold it into the original.  That's fine.

regards,
dan carpenter
