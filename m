From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 08 Nov 2010 13:42:57 +0000
Subject: Re: [PATCH] block: ioctl: fix information leak to userland
Message-Id: <4CD7FE61.4000606@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288882096-13456-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288882096-13456-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2010-11-04 15:48, Vasiliy Kulikov wrote:
> Structure hd_geometry is copied to userland with 4 padding bytes
> between cylinders and start fields uninitialized on 64-bit platforms.
> It leads to leaking of contents of kernel stack memory.
> 
> Currently there is no memset() in real implementations of getgeo()
> in drivers/block/, so it makes sense to have memset() in blkdev_ioctl().

Thanks, applied.

-- 
Jens Axboe

