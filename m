From: Jean Delvare <jdelvare@suse.de>
Date: Tue, 03 Oct 2017 12:20:11 +0000
Subject: Re: [PATCH] firmware: google: make structure gsmi_dev static
Message-Id: <20171003142011.4bd5a033@endymion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003084048.24375-1-colin.king@canonical.com>
In-Reply-To: <20171003084048.24375-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mike Waychison <mikew@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue,  3 Oct 2017 09:40:48 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure gsmi_dev is local to the source and does not need to be
> in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'gsmi_dev' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/firmware/google/gsmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
> index c8f169bf2e27..734146eec1b9 100644
> --- a/drivers/firmware/google/gsmi.c
> +++ b/drivers/firmware/google/gsmi.c
> @@ -84,7 +84,7 @@ struct gsmi_buf {
>  	u32 address;			/* physical address of buffer */
>  };
>  
> -struct gsmi_device {
> +static struct gsmi_device {
>  	struct platform_device *pdev;	/* platform device */
>  	struct gsmi_buf *name_buf;	/* variable name buffer */
>  	struct gsmi_buf *data_buf;	/* generic data buffer */

Acked-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
