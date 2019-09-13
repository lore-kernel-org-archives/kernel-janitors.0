From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 13 Sep 2019 13:44:40 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: make array static const and remove redundant assignment
Message-Id: <20190913134440.17711607CA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905150022.3609-1-colin.king@canonical.com>
In-Reply-To: <20190905150022.3609-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The array channel_all can be make static const rather than populating
> it on the stack, this makes the code smaller.  Also, variable place
> is being initialized with a value that is never read, so this assignment
> is redundant and can be removed.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  118537	   9591	      0	 128128	  1f480	realtek/rtlwifi/rtl8821ae/phy.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  118331	   9687	      0	 128018	  1f412	realtek/rtlwifi/rtl8821ae/phy.o
> 
> Saves 110 bytes, (gcc version 9.2.1, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

569ce0a486fd rtlwifi: rtl8821ae: make array static const and remove redundant assignment

-- 
https://patchwork.kernel.org/patch/11133295/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
