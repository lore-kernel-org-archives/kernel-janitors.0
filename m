From: walter harms <wharms@bfs.de>
Date: Wed, 18 Jan 2012 17:18:00 +0000
Subject: Re: [PATCH 1/4] drivers/staging: adjust double test
Message-Id: <4F16FEC8.1080901@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326403988-872-1-git-send-email-Julia.Lawall@lip6.fr> <1326403988-872-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326403988-872-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org



Am 12.01.2012 22:33, schrieb Julia Lawall:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Rewrite a duplicated test to test the correct value
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E;
> @@
> 
> (
> * E
>   || ... || E
> |
> * E
>   && ... && E
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/staging/gma500/mdfld_dsi_pkg_sender.c |    6 ++----
>  drivers/staging/rtl8192e/rtllib_rx.c          |    2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
> index 6c5061f..13979b5 100644
> --- a/drivers/staging/rtl8192e/rtllib_rx.c
> +++ b/drivers/staging/rtl8192e/rtllib_rx.c
> @@ -2453,7 +2453,7 @@ static inline void update_network(struct rtllib_network *dst,
>  	if (src->wmm_param[0].ac_aci_acm_aifsn ||
>  	   src->wmm_param[1].ac_aci_acm_aifsn ||
>  	   src->wmm_param[2].ac_aci_acm_aifsn ||
> -	   src->wmm_param[1].ac_aci_acm_aifsn)
> +	   src->wmm_param[3].ac_aci_acm_aifsn)
>  		memcpy(dst->wmm_param, src->wmm_param, WME_AC_PRAM_LEN);
>  
>  	dst->SignalStrength = src->SignalStrength;
> diff --git a/drivers/staging/gma500/mdfld_dsi_pkg_sender.c b/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
> index 9b96a5c..3a9f44f 100644
> --- a/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
> +++ b/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
> @@ -1249,8 +1249,7 @@ int mdfld_dsi_read_gen_hs(struct mdfld_dsi_pkg_sender *sender,
>  			u32 *data,
>  			u16 len)
>  {
> -	if (!sender || !data || param_num < 0 || param_num > 2
> -		|| !data || !len) {
> +	if (!sender || param_num < 0 || param_num > 2 || !data || !len) {
>  		DRM_ERROR("Invalid parameters\n");
>  		return -EINVAL;
>  	}
> @@ -1267,8 +1266,7 @@ int mdfld_dsi_read_gen_lp(struct mdfld_dsi_pkg_sender *sender,
>  			u32 *data,
>  			u16 len)
>  {
> -	if (!sender || !data || param_num < 0 || param_num > 2
> -		|| !data || !len) {
> +	if (!sender || param_num < 0 || param_num > 2 || !data || !len) {
>  		DRM_ERROR("Invalid parameters\n");
>  		return -EINVAL;
>  	}
> 
> --
Hi,
this is obviously correct but what is about readability ?
would it be an option to break it into two line (or two if) like:
  if (!sender || !data || !len)
	if ( param_num < 0 || param_num > 2 )

re,
 wh


