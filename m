From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 11 May 2020 12:37:45 +0000
Subject: Re: [PATCH] wcn36xx: Fix error handling path in 'wcn36xx_probe()'
Message-Id: <20200511123745.BBD65C433CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200507043619.200051-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, bjorn.andersson@linaro.org, marcel@holtmann.org, andy.gross@linaro.org, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> In case of error, 'qcom_wcnss_open_channel()' must be undone by a call to
> 'rpmsg_destroy_ept()', as already done in the remove function.
> 
> Fixes: 5052de8deff5 ("soc: qcom: smd: Transition client drivers from smd to rpmsg")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a86308fc534e wcn36xx: Fix error handling path in 'wcn36xx_probe()'

-- 
https://patchwork.kernel.org/patch/11532419/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
