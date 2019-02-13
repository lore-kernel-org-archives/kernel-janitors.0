From: Chao Yu <yuchao0@huawei.com>
Date: Wed, 13 Feb 2019 03:32:46 +0000
Subject: Re: [PATCH] f2fs: don't allow negative ->write_io_size_bits
Message-Id: <8f0cfae7-eb14-5e94-ad49-cfae222ce553@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211184514.GA22212@kadam>
In-Reply-To: <20190211184514.GA22212@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On 2019/2/12 2:45, Dan Carpenter wrote:
> We put an upper bound on ->write_io_size_bits but we don't have a lower
> bound.

Oh, lower bound, I think there are more cases didn't consider that,
let me check it.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
