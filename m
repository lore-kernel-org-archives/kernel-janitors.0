From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 18 May 2020 12:17:42 +0000
Subject: Re: [PATCH][next] rtw88: 8723d: fix incorrect setting of ldo_pwr
Message-Id: <20200518121742.20D94C43636@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200514181329.16292-1-colin.king@canonical.com>
In-Reply-To: <20200514181329.16292-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, "David S . Miller" <davem@davemloft.net>, Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently ldo_pwr has the LDO25 voltage bits set to zero and then
> it is overwritten with the new voltage setting. The assignment
> looks incorrect, it should be bit-wise or'ing in the new voltage
> setting rather than a direct assignment.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 1afb5eb7a00d ("rtw88: 8723d: Add cfg_ldo25 to control LDO25")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-drivers-next.git, thanks.

c5457559b626 rtw88: 8723d: fix incorrect setting of ldo_pwr

-- 
https://patchwork.kernel.org/patch/11549469/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
