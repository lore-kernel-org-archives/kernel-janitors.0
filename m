From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 28 Aug 2018 13:45:07 +0000
Subject: Re: [PATCH] ath9k: remove unused array firstep_table
Message-Id: <20180828134507.19787603D2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180816125030.4416-1-colin.king@canonical.com>
In-Reply-To: <20180816125030.4416-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Array firstep_table is being assigned but is never used
> hence it is redundant and can be removed.
> 
> Cleans up clang warning:
> warning: 'firstep_table' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a2f73a167dc1 ath9k: remove unused array firstep_table

-- 
https://patchwork.kernel.org/patch/10567385/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
