From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 06 Oct 2018 20:05:21 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: add in a missing break in switch statement
Message-Id: <a5113f03-7ac8-4be6-3d1c-5ba74639121e@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181006184246.29985-1-colin.king@canonical.com>
 <87r2h2euuy.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87r2h2euuy.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Tsang-Shian Lin <thlin@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/6/18 2:30 PM, Kalle Valo wrote:
> Colin King <colin.king@canonical.com> writes:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The switch case RATR_INX_WIRELESS_MC has a missing break, this seems
>> to be unintentional as the setting of variable ret gets overwritten
>> when the case falls through to the following RATR_INX_WIRELESS_AC_5N
>> case.  Fix this by adding in the missing break.
>>
>> Detected by CoverityScan, CID#1167237 ("Missing break in switch")
>>
>> Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   drivers/net/wireless/realtek/rtlwifi/rtl8821ae/hw.c | 1 +
> 
> Is the fixes line correct? This patch is not for staging.

No, the correct fixes commit is 21e4b0726dc67 (" rtlwifi: rtl8821ae: Move driver 
from staging to regular tree").

This driver was initially placed in staging as it was needed for a special 
project, which is the commit that Colin used. As the patch subject states, the 
driver was later moved to the regular wireless tree.

That break is required, thus ACKed-by: Larry Finger <Larry.Finger@lwfinger.net>

thanks,

Larry
