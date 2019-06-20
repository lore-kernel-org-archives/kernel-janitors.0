From: Kees Cook <keescook@chromium.org>
Date: Thu, 20 Jun 2019 18:13:32 +0000
Subject: Re: [PATCH][next] lkdtm: remove redundant initialization of ret
Message-Id: <201906201112.AE06471@keescook>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190614094311.24024-1-colin.king@canonical.com>
In-Reply-To: <20190614094311.24024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 14, 2019 at 10:43:11AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with the value -EINVAL however
> this value is never read and ret is being re-assigned later on. Hence
> the initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

Greg, can you take this please?

-Kees

> ---
>  drivers/misc/lkdtm/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index bba093224813..92df35fdeab0 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -390,7 +390,7 @@ static int __init lkdtm_module_init(void)
>  {
>  	struct crashpoint *crashpoint = NULL;
>  	const struct crashtype *crashtype = NULL;
> -	int ret = -EINVAL;
> +	int ret;
>  	int i;
>  
>  	/* Neither or both of these need to be set */
> -- 
> 2.20.1
> 

-- 
Kees Cook
