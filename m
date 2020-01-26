From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 26 Jan 2020 15:52:06 +0000
Subject: Re: [PATCH][next] iwlegacy: ensure loop counter addr does not wrap and cause an infinite loop
Message-Id: <20200126155206.5337DC4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126000954.22807-1-colin.king@canonical.com>
In-Reply-To: <20200126000954.22807-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, "David S . Miller" <davem@davemloft.net>, Meenakshi Venkataraman <meenakshi.venkataraman@intel.com>, Wey-Yi Guy <wey-yi.w.guy@intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The loop counter addr is a u16 where as the upper limit of the loop
> is an int. In the unlikely event that the il->cfg->eeprom_size is
> greater than 64K then we end up with an infinite loop since addr will
> wrap around an never reach upper loop limit. Fix this by making addr
> an int.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: be663ab67077 ("iwlwifi: split the drivers for agn and legacy devices 3945/4965")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

c2f9a4e4a5ab iwlegacy: ensure loop counter addr does not wrap and cause an infinite loop

-- 
https://patchwork.kernel.org/patch/11351769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
