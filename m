From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 14 Feb 2019 21:48:23 +0000
Subject: Re: [PATCH -next] RDMA/iwpm: Remove set but not used variable 'msg_seq'
Message-Id: <20190214214823.GA15690@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214015710.131712-1-yuehaibing@huawei.com>
In-Reply-To: <20190214015710.131712-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 14, 2019 at 01:57:10AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/core/iwpm_util.c: In function 'iwpm_send_hello':
> drivers/infiniband/core/iwpm_util.c:811:6: warning:
>  variable 'msg_seq' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit b0bad9ad514f ("RDMA/IWPM: Support
> no port mapping requirements")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/core/iwpm_util.c | 2 --
>  1 file changed, 2 deletions(-)

applied to for-next, thanks

Jason
