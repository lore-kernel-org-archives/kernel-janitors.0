From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Wed, 08 Aug 2018 20:06:23 +0000
Subject: Re: [PATCH net-next] ieee802154: hwsim: fix copy-paste error in hwsim_set_edge_lqi()
Message-Id: <7c8364e5-fba3-7aaa-28e2-14cd564ec1b3@datenfreihafen.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533696226-26445-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533696226-26445-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Alexander Aring <alex.aring@gmail.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Wei.

On 08/08/2018 04:43 AM, Wei Yongjun wrote:
> The return value from kzalloc() is not checked correctly. The
> test is done against a wrong variable. This patch fix it.
> 
> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ieee802154/mac802154_hwsim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
> index 1982308..04f4100 100644
> --- a/drivers/net/ieee802154/mac802154_hwsim.c
> +++ b/drivers/net/ieee802154/mac802154_hwsim.c
> @@ -564,7 +564,7 @@ static int hwsim_set_edge_lqi(struct sk_buff *msg, struct genl_info *info)
>  	}
>  
>  	einfo = kzalloc(sizeof(*einfo), GFP_KERNEL);
> -	if (!info) {
> +	if (!einfo) {
>  		mutex_unlock(&hwsim_phys_lock);
>  		return -ENOMEM;
>  	}
> 

Thanks a lot for finding and fixing these two bugs!

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt
