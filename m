From: Geoff Levand <geoff@infradead.org>
Date: Mon, 01 Oct 2018 22:45:14 +0000
Subject: Re: [PATCH] powerpc: signedness bug in update_flash_db()
Message-Id: <eddd842a-3754-9db6-9d10-aecd5ad42b4d@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181001164458.GB29197@mwanda>
In-Reply-To: <20181001164458.GB29197@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On 10/01/2018 09:44 AM, Dan Carpenter wrote:
> The "count < sizeof(struct os_area_db)" comparison is type promoted to
> size_t so negative values of "count" are treated as very high values and
> we accidentally return success instead of a negative error code.
> 
> This doesn't really change runtime much but it fixes a static checker
> warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/powerpc/platforms/ps3/os-area.c b/arch/powerpc/platforms/ps3/os-area.c
> index cdbfc5cfd6f3..f5387ad82279 100644
> --- a/arch/powerpc/platforms/ps3/os-area.c
> +++ b/arch/powerpc/platforms/ps3/os-area.c
> @@ -664,7 +664,7 @@ static int update_flash_db(void)
>  	db_set_64(db, &os_area_db_id_rtc_diff, saved_params.rtc_diff);
>  
>  	count = os_area_flash_write(db, sizeof(struct os_area_db), pos);
> -	if (count < sizeof(struct os_area_db)) {
> +	if (count < 0 || count < sizeof(struct os_area_db)) {
>  		pr_debug("%s: os_area_flash_write failed %zd\n", __func__,
>  			 count);
>  		error = count < 0 ? count : -EIO;
> 

Seems OK.

Acked-by: Geoff Levand <geoff@infradead.org>
