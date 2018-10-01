From: christophe leroy <christophe.leroy@c-s.fr>
Date: Mon, 01 Oct 2018 18:22:01 +0000
Subject: Re: [PATCH] powerpc: signedness bug in update_flash_db()
Message-Id: <6fa5827e-3346-4057-ca44-c6d9758f5837@c-s.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181001164458.GB29197@mwanda>
In-Reply-To: <20181001164458.GB29197@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Geoff Levand <geoff@infradead.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Cc: Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org



Le 01/10/2018 à 18:44, Dan Carpenter a écrit :
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
>   	db_set_64(db, &os_area_db_id_rtc_diff, saved_params.rtc_diff);
>   
>   	count = os_area_flash_write(db, sizeof(struct os_area_db), pos);
> -	if (count < sizeof(struct os_area_db)) {
> +	if (count < 0 || count < sizeof(struct os_area_db)) {

Why not simply add a cast ? :

if (count < (ssize_t)sizeof(struct os_area_db)) {


Christophe

>   		pr_debug("%s: os_area_flash_write failed %zd\n", __func__,
>   			 count);
>   		error = count < 0 ? count : -EIO;
> 

---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus
