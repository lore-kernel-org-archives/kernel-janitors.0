From: David Miller <davem@davemloft.net>
Date: Mon, 24 Feb 2020 00:41:54 +0000
Subject: Re: [PATCH] net: ena: ethtool: remove redundant non-zero check on rc
Message-Id: <20200223.164154.1411149705613568241.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200221232653.33134-1-colin.king@canonical.com>
In-Reply-To: <20200221232653.33134-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netanel@amazon.com, akiyano@amazon.com, gtzalik@amazon.com, saeedb@amazon.com, zorik@amazon.com, sameehj@amazon.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Feb 2020 23:26:53 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The non-zero check on rc is redundant as a previous non-zero
> check on rc will always return and the second check is never
> reached, hence it is redundant and can be removed.  Also
> remove a blank line.
> 
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
