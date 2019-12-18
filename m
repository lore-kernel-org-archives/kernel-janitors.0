From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:56:50 +0000
Subject: Re: [PATCH] ath11k: remove an unneeded NULL check
Message-Id: <20191218175650.44196C4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213105219.qbpng7eut5zgty2p@kili.mountain>
In-Reply-To: <20191213105219.qbpng7eut5zgty2p@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The list iterator is always non-NULL so it doesn't need to be checked.
> I also removed the unnecessary initializer because the list iterator is
> always initialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

269663f18474 ath11k: remove an unneeded NULL check

-- 
https://patchwork.kernel.org/patch/11290433/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
