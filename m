From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 13 Oct 2018 11:59:48 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: add in a missing break in switch statement
Message-Id: <20181013115948.230CE6072E@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181006184246.29985-1-colin.king@canonical.com>
In-Reply-To: <20181006184246.29985-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, Tsang-Shian Lin <thlin@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The switch case RATR_INX_WIRELESS_MC has a missing break, this seems
> to be unintentional as the setting of variable ret gets overwritten
> when the case falls through to the following RATR_INX_WIRELESS_AC_5N
> case.  Fix this by adding in the missing break.
> 
> Detected by CoverityScan, CID#1167237 ("Missing break in switch")
> 
> Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Dropping this patch per discussion.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/10629291/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
