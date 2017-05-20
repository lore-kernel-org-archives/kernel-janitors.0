From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 20 May 2017 02:22:59 +0000
Subject: Re: [PATCH] rtlwifi: btcoex: 23b 1ant: initialize bt_disabled to false
Message-Id: <a24c506c-6496-e8a0-a4a6-cf80280060e5@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519212539.cihnvwl7irchxoaj@mwanda>
In-Reply-To: <20170519212539.cihnvwl7irchxoaj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/19/2017 04:25 PM, Dan Carpenter wrote:
> We only want to disable this if bt_disable_cnt is >= 2.
> 
> Fixes: f66509e3d7c2 ("rtlwifi: btcoex: Remove 23b 1ant configuration parameter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Btw, that patch also introduced Sparse warning but I don't know how to
> address it.
> 
> drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtc8723b1ant.c:1432:63: warning: odd constant _Bool cast (2 becomes 1)

I agree that bt_disabled needs to be initialized. Actually, I would have 
expected an unitialized variable warning out of gcc.

Earlier today, I finished applying the rest of the btcoex patches from Realtek 
and now have a clean Sparse run. I never saw that message, and I certainly do 
not understand it either.

Larry

