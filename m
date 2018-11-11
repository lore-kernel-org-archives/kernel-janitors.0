From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 11 Nov 2018 07:55:18 +0000
Subject: Re: [PATCH] staging: mt7621-pinctrl: fix uninitialized variable ngroups
Message-Id: <20181111075518.GA23361@camaron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181110232806.14255-1-colin.king@canonical.com>
In-Reply-To: <20181110232806.14255-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Crispin <blogic@openwrt.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Nov 10, 2018 at 11:28:06PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the for_each_node_with_property loop us incrementing variable
> ngroups however it was not initialized and hence will contain garbage.
> Fix this by initializing ngroups to zero.
> 
> Detected with static analysis with cppcheck:
> 
> drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c:89]: (error) Uninitialized
> variable: ngroups
> 
> Fixes: e12a1a6e087b ("staging: mt7621-pinctrl: refactor rt2880_pinctrl_dt_node_to_map function")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> index b8566ed898f1..aa98fbb17013 100644
> --- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> +++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> @@ -82,7 +82,7 @@ static int rt2880_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrldev,
>  	struct property *prop;
>  	const char *function_name, *group_name;
>  	int ret;
> -	int ngroups;
> +	int ngroups = 0;
>  	unsigned int reserved_maps = 0;
>  
>  	for_each_node_with_property(np_config, "group")
> -- 
> 2.19.1
> 

Thanks, Colin. Looks good.

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos
