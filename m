From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 08 Oct 2019 15:42:55 +0000
Subject: Re: [PATCH] ath10k: Fix an && vs || typo
Message-Id: <20191008154255.6B9CD6119D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007085003.GB3865@mwanda>
In-Reply-To: <20191007085003.GB3865@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The kernel will Oops later in the function if either of these pointers
> is NULL so clearly || was intended instead of &&.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sorry, Colin was faster :)

https://patchwork.kernel.org/patch/11174955/

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11176991/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
