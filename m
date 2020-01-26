From: Stanislaw Gruszka <stf_xl@wp.pl>
Date: Sun, 26 Jan 2020 09:39:32 +0000
Subject: Re: [PATCH][next] iwlegacy: ensure loop counter addr does not wrap and cause an infinite loop
Message-Id: <20200126093932.GA605118@wp.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126000954.22807-1-colin.king@canonical.com>
In-Reply-To: <20200126000954.22807-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Meenakshi Venkataraman <meenakshi.venkataraman@intel.com>, Wey-Yi Guy <wey-yi.w.guy@intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jan 26, 2020 at 12:09:54AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The loop counter addr is a u16 where as the upper limit of the loop
> is a an int. In the unlikely event that the il->cfg->eeprom_size is
> greater than 64K then we end up with an infinite loop since addr will
> wrap around an never reach upper loop limit. Fix this by making addr
> an int.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: be663ab67077 ("iwlwifi: split the drivers for agn and legacy devices 3945/4965")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
