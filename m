From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Sun, 17 Nov 2019 23:56:40 +0000
Subject: Re: [PATCH -next] scsi: sd_zbc: Remove set but not used variable 'buflen'
Message-Id: <BYAPR04MB58168330EBC014EAD1BBC980E7720@BYAPR04MB5816.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115131829.162946-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

On 2019/11/15 22:20, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/sd_zbc.c: In function 'sd_zbc_check_zones':
> drivers/scsi/sd_zbc.c:341:9: warning:
>  variable 'buflen' set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit d9dd73087a8b ("block: Enhance
> blk_revalidate_disk_zones()")
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/scsi/sd_zbc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
> index 23281825ec38..0e5ede48f045 100644
> --- a/drivers/scsi/sd_zbc.c
> +++ b/drivers/scsi/sd_zbc.c
> @@ -338,7 +338,6 @@ static int sd_zbc_check_zoned_characteristics(struct scsi_disk *sdkp,
>  static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
>  			      u32 *zblocks)
>  {
> -	size_t buflen;
>  	u64 zone_blocks = 0;
>  	sector_t max_lba;
>  	unsigned char *rec;
> @@ -363,7 +362,6 @@ static int sd_zbc_check_zones(struct scsi_disk *sdkp, unsigned char *buf,
>  	}
>  
>  	/* Parse REPORT ZONES header */
> -	buflen = min_t(size_t, get_unaligned_be32(&buf[0]) + 64, SD_BUF_SIZE);
>  	rec = buf + 64;
>  	zone_blocks = get_unaligned_be64(&rec[8]);
>  	if (!zone_blocks || !is_power_of_2(zone_blocks)) {

Good catch !

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research
