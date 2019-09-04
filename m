From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 04 Sep 2019 06:08:01 +0000
Subject: Re: [PATCH] wil6210: Delete an unnecessary kfree() call in wil_tid_ampdu_rx_alloc()
Message-Id: <20190904060801.1FDD460863@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b9620e49-618d-b392-6456-17de5807df75@web.de>
In-Reply-To: <b9620e49-618d-b392-6456-17de5807df75@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, wil6210@qti.qualcomm.com, "David S. Miller" <davem@davemloft.net>, Maya Erez <merez@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Markus Elfring <Markus.Elfring@web.de> wrote:

> A null pointer would be passed to a call of the function “kfree”
> directly after a call of the function “kcalloc” failed at one place.
> Remove this superfluous function call.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d20b1e6c8307 wil6210: Delete an unnecessary kfree() call in wil_tid_ampdu_rx_alloc()

-- 
https://patchwork.kernel.org/patch/11117119/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
