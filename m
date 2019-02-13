From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 09:46:15 +0000
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't allow negative ->write_io_size_bits
Message-Id: <20190213094615.GE5458@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184514.GA22212@kadam>
 <8f0cfae7-eb14-5e94-ad49-cfae222ce553@huawei.com>
 <05f4eed5-8b71-e97f-464a-72f8c5ae804d@huawei.com>
In-Reply-To: <05f4eed5-8b71-e97f-464a-72f8c5ae804d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Yu <yuchao0@huawei.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On Wed, Feb 13, 2019 at 04:49:57PM +0800, Chao Yu wrote:
> On 2019/2/13 11:32, Chao Yu wrote:
> > On 2019/2/12 2:45, Dan Carpenter wrote:
> >> We put an upper bound on ->write_io_size_bits but we don't have a lower
> >> bound.
> > 
> > Oh, lower bound, I think there are more cases didn't consider that,
> > let me check it.
> 
> Sorry, one missing case:
> 
> Shouldn't it be:
> 
> if (arg <= 0 || arg > __ilog2_u32(BIO_MAX_PAGES)) {
>          ^

It wouldn't be hard for me to redo my patch, but I don't know enough to
say if zero is invalid and I don't want to get blamed for that...  Can
you do it, since you're better able to test the change?

So let's drop this patch, and then could you give me Reported-by credit
instead?

regards,
dan carpenter
