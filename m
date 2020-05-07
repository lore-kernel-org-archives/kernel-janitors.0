From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 07 May 2020 17:47:12 +0000
Subject: Re: [PATCH] wcn36xx: Fix error handling path in wcn36xx_probe()
Message-Id: <874ksr4oyn.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5345c72b-8d18-74ba-a6fa-bdc0f7dfb4c3@web.de>
In-Reply-To: <5345c72b-8d18-74ba-a6fa-bdc0f7dfb4c3@web.de> (Markus Elfring's
        message of "Thu, 7 May 2020 19:39:17 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, wcn36xx@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "David S. Miller" <davem@davemloft.net>, Marcel Holtmann <marcel@holtmann.org>

Markus Elfring <Markus.Elfring@web.de> writes:

> …
>> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> …
>> @@ -1359,6 +1359,8 @@ static int wcn36xx_probe(struct platform_device *pdev)
>>  out_unmap:
>>  	iounmap(wcn->ccu_base);
>>  	iounmap(wcn->dxe_base);
>> +out_channel:
>> +	rpmsg_destroy_ept(wcn->smd_channel);
>>  out_wq:
>>  	ieee80211_free_hw(hw);
>>  out_err:
>
> How do you think about to use the label “out_destroy_ept”?

Yeah, that's better. I'll change it in the pending branch before I
commit.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
