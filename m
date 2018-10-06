From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 06 Oct 2018 19:30:13 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: add in a missing break in switch statement
Message-Id: <87r2h2euuy.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181006184246.29985-1-colin.king@canonical.com>
In-Reply-To: <20181006184246.29985-1-colin.king@canonical.com> (Colin King's
        message of "Sat, 6 Oct 2018 19:42:46 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, Tsang-Shian Lin <thlin@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

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
> ---
>  drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c | 1 +

Is the fixes line correct? This patch is not for staging.

-- 
Kalle Valo
