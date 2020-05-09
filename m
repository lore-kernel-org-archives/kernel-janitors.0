From: Douglas Gilbert <dgilbert@interlog.com>
Date: Sat, 09 May 2020 14:45:07 +0000
Subject: Re: [PATCH] scsi: scsi_debug: fix an error handling bug in sdeb_zbc_model_str()
Message-Id: <0398fb52-dd1e-bb02-5160-69f2537132b7@interlog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509100408.GA5555@mwanda>
In-Reply-To: <20200509100408.GA5555@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020-05-09 6:04 a.m., Dan Carpenter wrote:
> This test is checking the wrong variable.  It should be testing "ret".
> The "sdeb_zbc_model" variable is an enum (unsigned in this situation)
> and we never assign negative values to it.
> 
> Fixes: 9267e0eb41fe ("scsi: scsi_debug: Add ZBC module parameter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

s/ret/res/ at the end of the first line above.

Acked-by: Douglas Gilbert <dgilbert@interlog.com>

> ---
>   drivers/scsi/scsi_debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 105e563d87b4e..73847366dc495 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -6460,7 +6460,7 @@ static int sdeb_zbc_model_str(const char *cp)
>   		res = sysfs_match_string(zbc_model_strs_b, cp);
>   		if (res < 0) {
>   			res = sysfs_match_string(zbc_model_strs_c, cp);
> -			if (sdeb_zbc_model < 0)
> +			if (res < 0)
>   				return -EINVAL;
>   		}
>   	}
> 
