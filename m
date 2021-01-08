From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 08 Jan 2021 04:19:37 +0000
Subject: Re: [PATCH v2] scsi: sd: remove obsolete variable in sd_remove()
Message-Id: <161007949339.9892.18140869017043061616.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214095424.12479-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201214095424.12479-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org

On Mon, 14 Dec 2020 10:54:24 +0100, Lukas Bulwahn wrote:

> Commit 140ea3bbf39a ("sd: use __register_blkdev to avoid a modprobe for an
> unregistered dev_t") removed blk_register_region(devt, ...) in sd_remove()
> and since then, devt is unused in sd_remove().
> 
> Hence, make W=1 warns:
> 
>   drivers/scsi/sd.c:3516:8:
>       warning: variable 'devt' set but not used [-Wunused-but-set-variable]
> 
> [...]

Applied to 5.11/scsi-fixes, thanks!

[1/1] scsi: sd: remove obsolete variable in sd_remove()
      https://git.kernel.org/mkp/scsi/c/be2553358cd4

-- 
Martin K. Petersen	Oracle Linux Engineering
