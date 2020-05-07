From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 07 May 2020 17:39:17 +0000
Subject: Re: [PATCH] wcn36xx: Fix error handling path in wcn36xx_probe()
Message-Id: <5345c72b-8d18-74ba-a6fa-bdc0f7dfb4c3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, wcn36xx@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Marcel Holtmann <marcel@holtmann.org>

…
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
…
> @@ -1359,6 +1359,8 @@ static int wcn36xx_probe(struct platform_device *pdev)
>  out_unmap:
>  	iounmap(wcn->ccu_base);
>  	iounmap(wcn->dxe_base);
> +out_channel:
> +	rpmsg_destroy_ept(wcn->smd_channel);
>  out_wq:
>  	ieee80211_free_hw(hw);
>  out_err:

How do you think about to use the label “out_destroy_ept”?

Regards,
Markus
