From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 26 Jan 2020 10:04:21 +0000
Subject: Re: [PATCH][next] iwlegacy: ensure loop counter addr does not wrap and cause an infinite loop
Message-Id: <7e76394c-cb50-e6e3-e3be-9574dcd7b5b8@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126000954.22807-1-colin.king@canonical.com>
In-Reply-To: <20200126000954.22807-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Meenakshi Venkataraman <meenakshi.venkataraman@intel.com>, Wey-Yi Guy <wey-yi.w.guy@intel.com>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 26.01.2020 3:09, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The loop counter addr is a u16 where as the upper limit of the loop
> is a an int. In the unlikely event that the il->cfg->eeprom_size is
      ^^^^
    Double article? :-)

> greater than 64K then we end up with an infinite loop since addr will
> wrap around an never reach upper loop limit. Fix this by making addr
> an int.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: be663ab67077 ("iwlwifi: split the drivers for agn and legacy devices 3945/4965")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR< Sergei
