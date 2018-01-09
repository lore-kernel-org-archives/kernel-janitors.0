From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 09 Jan 2018 08:20:30 +0000
Subject: Re: [V2] wcn36xx: fix incorrect assignment to msg_body.min_ch_time
Message-Id: <20180109082030.BE49F6081B@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171229090732.14928-1-colin.king@canonical.com>
In-Reply-To: <20171229090732.14928-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Eugene Krasnikov <k.eugene.e@gmail.com>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> The second assignment to msg_body.min_ch_time is incorrect, it
> should actually be to msg_body.max_ch_time.
> 
> Thanks to Bjorn Andersson for identifying the correct way to fix
> this as my original fix was incorrect.
> 
> Detected by CoverityScan, CID#1463042 ("Unused Value")
> 
> Fixes: 2f3bef4b247e ("wcn36xx: Add hardware scan offload support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4c8cf8df2f42 wcn36xx: fix incorrect assignment to msg_body.min_ch_time

-- 
https://patchwork.kernel.org/patch/10136929/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

