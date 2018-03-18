From: Boris Brezillon <boris.brezillon@bootlin.com>
Date: Sun, 18 Mar 2018 21:21:19 +0000
Subject: Re: [PATCH] mtd: block2mtd: remove redundant initialization of 'bdev'
Message-Id: <20180318222119.126754d4@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180120220934.21992-1-colin.king@canonical.com>
In-Reply-To: <20180120220934.21992-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 20 Jan 2018 22:09:34 +0000
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer bdev is being initialized however this value is never
> read as bdev is assigned an updated value from the returned
> call to blkdev_get_by_path.  Remove the redundant assignment.
> 
> Cleans up clang warning:
> drivers/mtd/devices/block2mtd.c:228:23: warning: Value stored to
> 'bdev' during its initialization is never read
> 

Applied.

Thanks,

Boris

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/devices/block2mtd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
> index 62fd6905c648..bb0734600a07 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
> @@ -225,7 +225,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
>  	int i;
>  #endif
>  	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> -	struct block_device *bdev = ERR_PTR(-ENODEV);
> +	struct block_device *bdev;
>  	struct block2mtd_dev *dev;
>  	char *name;
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
