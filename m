From: Felix Fietkau <nbd@nbd.name>
Date: Fri, 23 Aug 2019 11:07:37 +0000
Subject: Re: [PATCH][next] mac80211: minstrel_ht: fix infinite loop because supported is not being shifted
Message-Id: <accffa31-b954-0dcd-6c42-44fad63b96e2@nbd.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822122034.28664-1-colin.king@canonical.com>
In-Reply-To: <20190822122034.28664-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Johannes Berg <johannes@sipsolutions.net>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019-08-22 14:20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the for-loop will spin forever if variable supported is
> non-zero because supported is never changed.  Fix this by adding in
> the missing right shift of supported.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: 48cb39522a9d ("mac80211: minstrel_ht: improve rate probing for devices with static fallback")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Felix Fietkau <nbd@nbd.name>

Thanks,

- Felix
