From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 02 May 2019 14:58:37 +0000
Subject: Re: [PATCH][next] rtw88: fix shift of more than 32 bits of a integer
Message-Id: <20190502145837.0511B608D4@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190501141945.22522-1-colin.king@canonical.com>
In-Reply-To: <20190501141945.22522-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yan-Hsuan Chuang <yhchuang@realtek.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the shift of an integer value more than 32 bits can
> occur when nss is more than 32.  Fix this by making the integer
> constants unsigned long longs before shifting and bit-wise or'ing
> with the u64 ra_mask to avoid the undefined shift behaviour.
> 
> Addresses-Coverity: ("Bad shift operation")
> Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

b85bd9a14c4b rtw88: fix shift of more than 32 bits of a integer

-- 
https://patchwork.kernel.org/patch/10925147/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
