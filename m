From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 May 2017 13:52:11 +0000
Subject: Re: rtlwifi: btcoex: 23b 1ant: initialize bt_disabled to false
Message-Id: <20170524135211.11061611C5@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519212539.cihnvwl7irchxoaj@mwanda>
In-Reply-To: <20170519212539.cihnvwl7irchxoaj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Chaoming Li <chaoming_li@realsil.com.cn>, Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We only want to disable this if bt_disable_cnt is >= 2.
> 
> Fixes: f66509e3d7c2 ("rtlwifi: btcoex: Remove 23b 1ant configuration parameter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Patch applied to wireless-drivers-next.git, thanks.

e578618934cb rtlwifi: btcoex: 23b 1ant: initialize bt_disabled to false

-- 
https://patchwork.kernel.org/patch/9738199/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

