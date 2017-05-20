From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 20 May 2017 15:02:39 +0000
Subject: Re: [PATCH] rtlwifi: btcoex: 23b 1ant: initialize bt_disabled to false
Message-Id: <8cacfc28-17e4-b0b1-8667-e59f37c777e0@lwfinger.net>
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

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
