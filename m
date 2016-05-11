From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 11 May 2016 18:54:33 +0000
Subject: Re: rtlwifi: rtl818x: silence uninitialized variable warning
Message-Id: <20160511185433.DE30C61344@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160504061639.GB22064@mwanda>
References: <20160504061639.GB22064@mwanda>
In-Reply-To: <20160504061639.GB22064@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Chaoming Li <chaoming_li@realsil.com.cn>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:
> What about if "rtlphy->pwrgroup_cnt" is 2?  In that case we would use an
> uninitialized "chnlgroup" variable and probably crash.  Maybe that can't
> happen for some reason which is not obvious but in that case this patch
> is harmless.
> 
> Setting it to zero seems like a standard default in the surrounding code
> so it's probably fine here as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, 1 patch applied to wireless-drivers-next.git:

2f8514b8b036 rtlwifi: rtl818x: silence uninitialized variable warning

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9010761/

