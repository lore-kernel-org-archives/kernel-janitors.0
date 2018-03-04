From: David Miller <davem@davemloft.net>
Date: Sun, 04 Mar 2018 23:18:51 +0000
Subject: Re: [PATCH] net: amd8111e: remove redundant assignment to 'tx_index'
Message-Id: <20180304.181851.613090020932353342.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180301164240.18014-1-colin.king@canonical.com>
In-Reply-To: <20180301164240.18014-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  1 Mar 2018 16:42:40 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tx_index is being initialized with a value that is never
> read and re-assigned a little later, hence the initialization is redundant
> and can be removed.
> 
> Cleans up clang warning:
> drivers/net/ethernet/amd/amd8111e.c:652:6: warning: Value stored to
> 'tx_index' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
