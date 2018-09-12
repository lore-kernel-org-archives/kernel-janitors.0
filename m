From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 12 Sep 2018 04:58:48 +0000
Subject: Re: [PATCH] firmware: vpd: fix spelling mistake "partion" -> "partition"
Message-Id: <50220bc9-326f-7a93-fecb-9b67fbac98b9@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180911165858.3015-1-colin.king@canonical.com>
In-Reply-To: <20180911165858.3015-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/11/2018 09:58 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in comment
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Interesting - drivers/firmware/google/ does not have a maintainer.
Greg - is it correct to assume that you are the de-facto maintainer ?

Guenter

> ---
>   drivers/firmware/google/vpd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
> index 1aa67bb5d8c0..c0c0b4e4e281 100644
> --- a/drivers/firmware/google/vpd.c
> +++ b/drivers/firmware/google/vpd.c
> @@ -198,7 +198,7 @@ static int vpd_section_init(const char *name, struct vpd_section *sec,
>   
>   	sec->name = name;
>   
> -	/* We want to export the raw partion with name ${name}_raw */
> +	/* We want to export the raw partition with name ${name}_raw */
>   	sec->raw_name = kasprintf(GFP_KERNEL, "%s_raw", name);
>   	if (!sec->raw_name) {
>   		err = -ENOMEM;
> 
