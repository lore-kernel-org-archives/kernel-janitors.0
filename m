From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 06 Aug 2018 12:11:03 +0000
Subject: Re: [PATCH][usb-next] USB: typec: fsusb302: remove unused variables snk_pdo and toggling_mode_name
Message-Id: <20180806121103.GC1634@kuha.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180806111414.9436-1-colin.king@canonical.com>
In-Reply-To: <20180806111414.9436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 06, 2018 at 12:14:14PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables snk_pdo and toggling_mode_name are defined but are not used and
> hence can be removed.
> 
> Cleans up clang warnings:
> warning: 'snk_pdo' defined but not used [-Wunused-const-variable=]
> warning: 'toggling_mode_name' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/fusb302/fusb302.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
> index 82bed9810be6..ad7cfed1cea7 100644
> --- a/drivers/usb/typec/fusb302/fusb302.c
> +++ b/drivers/usb/typec/fusb302/fusb302.c
> @@ -48,13 +48,6 @@ enum toggling_mode {
>  	TOGGLING_MODE_SRC,
>  };
>  
> -static const char * const toggling_mode_name[] = {
> -	[TOGGLINE_MODE_OFF]	= "toggling_OFF",
> -	[TOGGLING_MODE_DRP]	= "toggling_DRP",
> -	[TOGGLING_MODE_SNK]	= "toggling_SNK",
> -	[TOGGLING_MODE_SRC]	= "toggling_SRC",
> -};
> -
>  enum src_current_status {
>  	SRC_CURRENT_DEFAULT,
>  	SRC_CURRENT_MEDIUM,
> @@ -1178,10 +1171,6 @@ static const u32 src_pdo[] = {
>  	PDO_FIXED(5000, 400, PDO_FIXED_FLAGS),
>  };
>  
> -static const u32 snk_pdo[] = {
> -	PDO_FIXED(5000, 400, PDO_FIXED_FLAGS),
> -};
> -
>  static const struct tcpc_config fusb302_tcpc_config = {
>  	.src_pdo = src_pdo,
>  	.nr_src_pdo = ARRAY_SIZE(src_pdo),

Thanks,

-- 
heikki
