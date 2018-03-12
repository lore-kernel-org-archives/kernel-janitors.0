From: David Miller <davem@davemloft.net>
Date: Mon, 12 Mar 2018 15:12:57 +0000
Subject: Re: [PATCH][next] lan743x: remove some redundant variables and assignments
Message-Id: <20180312.111257.2221362853661035214.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311164233.27139-1-colin.king@canonical.com>
In-Reply-To: <20180311164233.27139-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 11 Mar 2018 17:42:33 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Function lan743x_phy_init assigns pointer 'netdev' but this is never read
> and hence it can be removed. The return error code handling can also be
> cleaned up to remove the variable 'ret'.
> 
> Function lan743x_phy_link_status_change assigns pointer 'phy' twice and
> this is never read, so it also can be removed.
> 
> Finally, function lan743x_tx_napi_poll initializes pointer 'adapter'
> and then re-assigns the same value into this pointer a little later on
> so this second assignment is redundant and can be also removed.
> 
> Cleans up clang warnings:
> drivers/net/ethernet/microchip/lan743x_main.c:951:2: warning: Value
> stored to 'netdev' is never read
> drivers/net/ethernet/microchip/lan743x_main.c:971:3: warning: Value
> stored to 'phy' is never read
> drivers/net/ethernet/microchip/lan743x_main.c:1583:26: warning: Value
> stored to 'adapter' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
