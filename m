From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 08 Jan 2018 17:41:05 +0000
Subject: Re: wl1251: check return from call to wl1251_acx_arp_ip_filter
Message-Id: <20180108174105.1C68E60314@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171226173318.5076-1-colin.king@canonical.com>
In-Reply-To: <20171226173318.5076-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Pavel Machek <pavel@ucw.cz>, Cong Wang <xiyou.wangcong@gmail.com>, Johannes Berg <johannes.berg@intel.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the less than zero error check on ret is incorrect
> as it is checking a far earlier ret assignment rather than the
> return from the call to wl1251_acx_arp_ip_filter. Fix this by
> adding in the missing assginment.
> 
> Detected by CoverityScan, CID#1164835 ("Logically dead code")
> 
> Fixes: 204cc5c44fb6 ("wl1251: implement hardware ARP filtering")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

ac1181c60822 wl1251: check return from call to wl1251_acx_arp_ip_filter

-- 
https://patchwork.kernel.org/patch/10133201/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

