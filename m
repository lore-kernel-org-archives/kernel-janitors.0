From: merez@codeaurora.org
Date: Sat, 08 Dec 2018 18:08:42 +0000
Subject: Re: [PATCH] wil6210: remove set but not used variable 'wdev'
Message-Id: <93252d599bfcf6073c612d4386e2b7bc@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543996743-137124-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543996743-137124-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless-owner@vger.kernel.org

On 2018-12-05 09:59, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/wil6210/main.c: In function 
> '_wil6210_disconnect':
> drivers/net/wireless/ath/wil6210/main.c:407:23: warning:
>  variable 'wdev' set but not used [-Wunused-but-set-variable]
> 
> It never used since commit ("e1b43407c034 wil6210: refactor disconnect 
> flow")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/wireless/ath/wil6210/main.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Maya Erez <merez@codeaurora.org>
-- 
Maya Erez
Qualcomm Israel, Inc. on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
