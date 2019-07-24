From: maowenan <maowenan@huawei.com>
Date: Wed, 24 Jul 2019 01:32:13 +0000
Subject: Re: [net-next] mwifiex: use eth_broadcast_addr() to assign broadcast address
Message-Id: <609fa4ae-7210-7758-c8ff-1b06492356e1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190710072524.65953-1-maowenan@huawei.com>
In-Reply-To: <20190710072524.65953-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com, huxinming820@gmail.com, kvalo@codeaurora.org
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

gentle ping...

On 2019/7/10 15:25, Mao Wenan wrote:
> This patch is to use eth_broadcast_addr() to assign broadcast address
> insetad of memcpy().
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/tdls.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
> index 18e654d..0931304 100644
> --- a/drivers/net/wireless/marvell/mwifiex/tdls.c
> +++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
> @@ -731,7 +731,6 @@ mwifiex_construct_tdls_action_frame(struct mwifiex_private *priv,
>  				    u16 status_code, struct sk_buff *skb)
>  {
>  	struct ieee80211_mgmt *mgmt;
> -	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
>  	int ret;
>  	u16 capab;
>  	struct ieee80211_ht_cap *ht_cap;
> @@ -765,7 +764,7 @@ mwifiex_construct_tdls_action_frame(struct mwifiex_private *priv,
>  		memmove(pos + ETH_ALEN, &mgmt->u.action.category,
>  			sizeof(mgmt->u.action.u.tdls_discover_resp));
>  		/* init address 4 */
> -		memcpy(pos, bc_addr, ETH_ALEN);
> +		eth_broadcast_addr(pos);
>  
>  		ret = mwifiex_tdls_append_rates_ie(priv, skb);
>  		if (ret) {
> 
