From: merez@codeaurora.org
Date: Tue, 11 Sep 2018 19:04:28 +0000
Subject: Re: [PATCH] wil6210: remove set but not used variable 'start'
Message-Id: <dc5a51943508e915c860c2c7dcafe23c@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless-owner@vger.kernel.org

On 2018-09-11 15:32, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/wil6210/pm.c: In function 
> 'wil_suspend_keep_radio_on':
> drivers/net/wireless/ath/wil6210/pm.c:193:16: warning:
>  variable 'start' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Maya Erez <merez@codeaurora.org>

-- 
Maya Erez
Qualcomm Israel, Inc. on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
