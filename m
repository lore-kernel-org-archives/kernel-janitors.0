From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 02 Dec 2020 18:32:12 +0000
Subject: Re: [PATCH 1/2] ath10k: Fix an error handling path
Message-Id: <20201202183212.13942C43462@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201122170342.1346011-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201122170342.1346011-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, erik.stromdahl@gmail.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'ath10k_usb_create()' fails, we should release some resources and report
> an error instead of silently continuing.
> 
> Fixes: 4db66499df91 ("ath10k: add initial USB support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

ed3573bc3943 ath10k: Fix an error handling path
6364e693f4a7 ath10k: Release some resources in an error handling path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201122170342.1346011-1-christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
