From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 24 Aug 2017 09:54:10 +0000
Subject: Re: rtlwifi: make a couple arrays larger
Message-Id: <20170824095410.1E2B9606B7@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818080519.mvjls5pgnxeknzpk@mwanda>
In-Reply-To: <20170818080519.mvjls5pgnxeknzpk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Chaoming Li <chaoming_li@realsil.com.cn>, Ping-Ke Shih <pkshih@realtek.com>, Maxim Samoylov <max7255@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This is a static checker fix.  "cal_num" is 10.  We're declaring the
> tx_dt[] and rx_td[] arrays as 3 element arrays.  The static checker
> complains that we do:
> 
> 	tx_dt[cal] = (vdf_y[1]>>20)-(vdf_y[0]>>20);
> 
> "cal" is the iterator and it is in the 0-9 range so it looks like
> we could corrupt memory.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Patch applied to wireless-drivers-next.git, thanks.

d9ee6015e573 rtlwifi: make a couple arrays larger

-- 
https://patchwork.kernel.org/patch/9907821/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

