From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 20 Dec 2018 17:05:43 +0000
Subject: Re: [PATCH] ath10k: fix a NULL vs IS_ERR() check
Message-Id: <20181220170543.1CE29607F1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126081143.tvu55aimdc3safcq@kili.mountain>
In-Reply-To: <20181126081143.tvu55aimdc3safcq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_memremap() function doesn't return NULLs, it returns error
> pointers.
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c28dcbce0592 ath10k: fix a NULL vs IS_ERR() check

-- 
https://patchwork.kernel.org/patch/10697755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
