From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 18 Dec 2020 09:05:27 +0000
Subject: Re: [PATCH] ath11k: dp: clean up a variable name
Message-Id: <20201218090527.A859DC43461@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9s7QAHDM2OTIo3a@mwanda>
In-Reply-To: <X9s7QAHDM2OTIo3a@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "&ar->ab->base_lock" and "&ab->base_lock" locks are the same lock
> but it's nicer to use the same name consistently everywhere.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

abdcd4cbec42 ath11k: dp: clean up a variable name

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X9s7QAHDM2OTIo3a@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
