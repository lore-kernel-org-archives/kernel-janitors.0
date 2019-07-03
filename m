From: Leon Romanovsky <leon@kernel.org>
Date: Wed, 03 Jul 2019 07:20:23 +0000
Subject: Re: [PATCH -next] RDMA/hns: Remove set but not used variable 'fclr_write_fail_flag'
Message-Id: <20190703072023.GY4727@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 03, 2019 at 03:10:21AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_function_clear':
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:1135:7: warning:
>  variable 'fclr_write_fail_flag' set but not used [-Wunused-but-set-variable]
>
> It is never used, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 --
>  1 file changed, 2 deletions(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
