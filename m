From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Sat, 20 May 2017 15:01:24 +0000
Subject: Re: [PATCH] rtlwifi: btcoex: 23b 1ant: fix halbtc8723b1ant_action_wifi_only()
Message-Id: <643aa5f9-5634-d910-e10f-51523e464b50@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170520053343.gwdinyn447bwpia2@mwanda>
In-Reply-To: <20170520053343.gwdinyn447bwpia2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/20/2017 12:33 AM, Dan Carpenter wrote:
> The parameters are in the wrong order when we call
> halbtc8723b1ant_set_ant_path() so it's equivalent of calling:
> 
> 	halbtc8723b1ant_set_ant_path(btcoexist, BTC_ANT_PATH_WIFI, false, true);
> 
> Fixes: f66509e3d7c2 ("rtlwifi: btcoex: Remove 23b 1ant configuration parameter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Now I know why I did not see the Sparse error. This problem was fixed in 
https://patchwork.kernel.org/patch/9737583/, which is waiting to be merged. Once 
that one is merged, this patch will no longer apply.

NACK.

Larry
