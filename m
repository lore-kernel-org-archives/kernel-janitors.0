From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 18 Nov 2019 15:33:08 +0000
Subject: Re: [PATCH -next] scsi: sd_zbc: Remove set but not used variable 'buflen'
Message-Id: <321d25d4-2216-dae2-268b-ca225c5e5caa@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115131829.162946-1-yuehaibing@huawei.com>
In-Reply-To: <20191115131829.162946-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Damien Le Moal <damien.lemoal@wdc.com>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On 11/15/19 6:18 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/sd_zbc.c: In function 'sd_zbc_check_zones':
> drivers/scsi/sd_zbc.c:341:9: warning:
>   variable 'buflen' set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit d9dd73087a8b ("block: Enhance
> blk_revalidate_disk_zones()")

Applied, thanks.

-- 
Jens Axboe
