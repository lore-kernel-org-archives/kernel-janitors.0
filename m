From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Fri, 18 Aug 2017 13:09:43 +0000
Subject: Re: [PATCH] rtlwifi: make a couple arrays larger
Message-Id: <a3aeacec-750a-aca3-2943-e13d57e7539a@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818080519.mvjls5pgnxeknzpk@mwanda>
In-Reply-To: <20170818080519.mvjls5pgnxeknzpk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, Kalle Valo <kvalo@codeaurora.org>, Ping-Ke Shih <pkshih@realtek.com>, Maxim Samoylov <max7255@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/18/2017 03:05 AM, Dan Carpenter wrote:
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
> ---
> I'm pretty sure this patch is correct and absolutely harmless.  But the
> code is pretty involved and I didn't test it.  So you may want to review
> this one carefully.

I believe the patch is correct. In testing, I also confirmed that this branch is 
executed, thus the memory corruption does happen.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry
