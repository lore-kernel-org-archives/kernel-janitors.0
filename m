From: Aaron Lu <aaron.lu@intel.com>
Date: Wed, 30 May 2018 06:20:39 +0000
Subject: Re: [PATCH] libata: zpodd: small read overflow in eject_tray()
Message-Id: <20180530062038.GE14785@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180529091320.axeryttqycdexzm5@kili.mountain>
In-Reply-To: <20180529091320.axeryttqycdexzm5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 29, 2018 at 12:13:24PM +0300, Dan Carpenter wrote:
> We read from the cdb[] buffer in ata_exec_internal_sg().  It has to be
> ATAPI_CDB_LEN (16) bytes long, but this buffer is only 12 bytes.

Thanks for the fix!

> 
> Fixes: 213342053db5 ("libata: handle power transition of ODD")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/ata/libata-zpodd.c b/drivers/ata/libata-zpodd.c
> index de4ddd0e8550..b3ed8f9953a8 100644
> --- a/drivers/ata/libata-zpodd.c
> +++ b/drivers/ata/libata-zpodd.c
> @@ -35,7 +35,7 @@ struct zpodd {
>  static int eject_tray(struct ata_device *dev)
>  {
>  	struct ata_taskfile tf;
> -	static const char cdb[] = {  GPCMD_START_STOP_UNIT,
> +	static const char cdb[ATAPI_CDB_LEN] = {  GPCMD_START_STOP_UNIT,
>  		0, 0, 0,
>  		0x02,     /* LoEj */
>  		0, 0, 0, 0, 0, 0, 0,
