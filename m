From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 14 Jul 2017 19:09:46 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: Fix HW_VAR_NAV_UPPER operation
Message-Id: <5992b195-2ebb-a620-3324-ca2d689e11a7@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713074323.r7rjpnp6ghrdtjgx@mwanda>
In-Reply-To: <20170713074323.r7rjpnp6ghrdtjgx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Masanari Iida <standby24x7@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/13/2017 02:43 AM, Dan Carpenter wrote:
> The cast here is wrong.  We want to cast the pointer but we accidentally
> do a no-op cast of the value.  We normally want to set us_nav_upper to
> WIFI_NAV_UPPER_US (30000) but because of this bug we instead set it to
> 184 on little endian systems and 0 on big endian ones.
> 
> Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks for catching this error. I suspect a typo, but your fix is obviously correct.

Does the "Fixes" notation imply a Cc to stable? If not, then the patch needs a 
Cc to stable for 3.14+.

Thanks again,

Larry
