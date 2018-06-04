From: David Miller <davem@davemloft.net>
Date: Mon, 04 Jun 2018 15:31:29 +0000
Subject: Re: [PATCH] net: aquantia: make function aq_fw2x_get_mac_permanent static
Message-Id: <20180604.113129.2259414741108607335.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180601152834.17958-1-colin.king@canonical.com>
In-Reply-To: <20180601152834.17958-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: igor.russkikh@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  1 Jun 2018 16:28:34 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function aq_fw2x_get_mac_permanent is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> warning: symbol 'aq_fw2x_get_mac_permanent' was not declared. Should it
> be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thank you.
