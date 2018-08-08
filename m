From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Wed, 08 Aug 2018 20:06:39 +0000
Subject: Re: [PATCH net-next] ieee802154: hwsim: fix missing unlock on error in hwsim_add_one()
Message-Id: <73fe2c82-3f01-5570-5afc-b24cae4cbc65@datenfreihafen.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533697839-85602-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533697839-85602-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Alexander Aring <alex.aring@gmail.com>
Cc: linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Wei.

On 08/08/2018 05:10 AM, Wei Yongjun wrote:
> Add the missing unlock before return from function hwsim_add_one()
> in the error handling case.
> 
> Fixes: f25da51fdc38 ("ieee802154: hwsim: add replacement for fakelb")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ieee802154/mac802154_hwsim.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ieee802154/mac802154_hwsim.c b/drivers/net/ieee802154/mac802154_hwsim.c
> index f4e9205..44d398c 100644
> --- a/drivers/net/ieee802154/mac802154_hwsim.c
> +++ b/drivers/net/ieee802154/mac802154_hwsim.c
> @@ -810,8 +810,10 @@ static int hwsim_add_one(struct genl_info *info, struct device *dev,
>  	mutex_lock(&hwsim_phys_lock);
>  	if (init) {
>  		err = hwsim_subscribe_all_others(phy);
> -		if (err < 0)
> +		if (err < 0) {
> +			mutex_unlock(&hwsim_phys_lock);
>  			goto err_reg;
> +		}
>  	}
>  	list_add_tail(&phy->list, &hwsim_phys);
>  	mutex_unlock(&hwsim_phys_lock);
> 

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt
