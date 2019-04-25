From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 25 Apr 2019 16:50:46 +0000
Subject: Re: [PATCH] mwifiex: prevent an array overflow
Message-Id: <20190425165046.EBF8160388@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404084423.GB20193@kadam>
In-Reply-To: <20190404084423.GB20193@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Xinming Hu <huxm@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "rate_index" is only used as an index into the phist_data->rx_rate[]
> array in the mwifiex_hist_data_set() function.  That array has
> MWIFIEX_MAX_AC_RX_RATES (74) elements and it's used to generate some
> debugfs information.  The "rate_index" variable comes from the network
> skb->data[] and it is a u8 so it's in the 0-255 range.  We need to cap
> it to prevent an array overflow.
> 
> Fixes: cbf6e05527a7 ("mwifiex: add rx histogram statistics support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

b4c35c17227f mwifiex: prevent an array overflow

-- 
https://patchwork.kernel.org/patch/10885297/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
