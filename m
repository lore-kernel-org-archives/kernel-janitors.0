From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 02 Dec 2020 18:20:32 +0000
Subject: Re: [PATCH] ath11k: Fix an error handling path
Message-Id: <20201202182032.6D184C43462@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201122173943.1366167-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201122173943.1366167-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, gseset@codeaurora.org, mkenna@codeaurora.org, slakkavalli@datto.com, gsamin@codeaurora.org, pradeepc@codeaurora.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'kzalloc' fails, we must return an error code.
> 
> While at it, remove a useless initialization of 'err' which could hide the
> issue.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e7bcc145bcd0 ath11k: Fix an error handling path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201122173943.1366167-1-christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
