From: Chao Yu <yuchao0@huawei.com>
Date: Thu, 21 Jun 2018 06:10:03 +0000
Subject: Re: [PATCH] f2fs: Fix uninitialized return in f2fs_ioc_shutdown()
Message-Id: <f490775d-c56f-e2db-9470-14a04d1b6210@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620103953.bxdqzy2izn3elii7@kili.mountain>
In-Reply-To: <20180620103953.bxdqzy2izn3elii7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Sahitya Tummala <stummala@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On 2018/6/20 18:39, Dan Carpenter wrote:
> "ret" can be uninitialized on the success path when "in =
> F2FS_GOING_DOWN_FULLSYNC".
> 
> Fixes: 60b2b4ee2bc0 ("f2fs: Fix deadlock in shutdown ioctl")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

