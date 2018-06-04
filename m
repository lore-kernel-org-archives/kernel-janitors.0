From: Jean Delvare <jdelvare@suse.de>
Date: Mon, 04 Jun 2018 11:54:12 +0000
Subject: Re: [PATCH] firmware-gsmi: make structure gsmi_dev static
Message-Id: <20180604135412.2f8316e9@endymion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601131939.4959-1-colin.king@canonical.com>
In-Reply-To: <20180601131939.4959-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri,  1 Jun 2018 14:19:39 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure gsmi_dev is local to the source and does not need to be
> in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/firmware/google/gsmi.c:96:3: warning: symbol 'gsmi_dev' was
> not declared. Should it be static?
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

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
