From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 20 Dec 2018 17:07:05 +0000
Subject: Re: [PATCH] ath10k: remove an unnecessary NULL check
Message-Id: <20181220170705.28A1F60595@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129142406.GV3073@unbuntlaptop>
In-Reply-To: <20181129142406.GV3073@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "survey" pointer is the address of an array element.  We know that
> it can't be NULL so this check can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

27120f2ac995 ath10k: remove an unnecessary NULL check

-- 
https://patchwork.kernel.org/patch/10704625/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
