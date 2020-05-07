From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 07 May 2020 04:52:55 +0000
Subject: Re: [PATCH] wcn36xx: Fix error handling path in 'wcn36xx_probe()'
Message-Id: <20200507045255.GB3236072@builder.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kvalo@codeaurora.org, davem@davemloft.net, marcel@holtmann.org, andy.gross@linaro.org, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 06 May 21:36 PDT 2020, Christophe JAILLET wrote:

> In case of error, 'qcom_wcnss_open_channel()' must be undone by a call to
> 'rpmsg_destroy_ept()', as already done in the remove function.
> 
> Fixes: 5052de8deff5 ("soc: qcom: smd: Transition client drivers from smd to rpmsg")

It seems I introduced this bug in f303a9311065 ("wcn36xx: Transition
driver to SMD client"), but your patch should should apply back to your
Fixes, so I think it's good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not 100% sure of the commit for Fixes, but it is consistent with the
> analysis in efad8396e906 where the same call has been added in the remove
> function.
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
> index e49c306e0eef..1acdc13a74fc 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1339,7 +1339,7 @@ static int wcn36xx_probe(struct platform_device *pdev)
>  	if (addr && ret != ETH_ALEN) {
>  		wcn36xx_err("invalid local-mac-address\n");
>  		ret = -EINVAL;
> -		goto out_wq;
> +		goto out_channel;
>  	} else if (addr) {
>  		wcn36xx_info("mac address: %pM\n", addr);
>  		SET_IEEE80211_PERM_ADDR(wcn->hw, addr);
> @@ -1347,7 +1347,7 @@ static int wcn36xx_probe(struct platform_device *pdev)
>  
>  	ret = wcn36xx_platform_get_resources(wcn, pdev);
>  	if (ret)
> -		goto out_wq;
> +		goto out_channel;
>  
>  	wcn36xx_init_ieee80211(wcn);
>  	ret = ieee80211_register_hw(wcn->hw);
> @@ -1359,6 +1359,8 @@ static int wcn36xx_probe(struct platform_device *pdev)
>  out_unmap:
>  	iounmap(wcn->ccu_base);
>  	iounmap(wcn->dxe_base);
> +out_channel:
> +	rpmsg_destroy_ept(wcn->smd_channel);
>  out_wq:
>  	ieee80211_free_hw(hw);
>  out_err:
> -- 
> 2.25.1
> 
