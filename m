From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Oct 2019 08:46:26 +0000
Subject: Re: [PATCH][next] ath10k: fix null dereference on pointer crash_data
Message-Id: <20191011084626.E2F5D60AA3@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004160227.31577-1-colin.king@canonical.com>
In-Reply-To: <20191004160227.31577-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Currently when pointer crash_data is null the present null check
> will also check that crash_data->ramdump_buf is null and will cause
> a null pointer dereference on crash_data. Fix this by using the ||
> operator instead of &&.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a69d3bdd4d40 ath10k: fix null dereference on pointer crash_data

-- 
https://patchwork.kernel.org/patch/11174955/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
