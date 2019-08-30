From: David Miller <davem@davemloft.net>
Date: Fri, 30 Aug 2019 21:15:08 +0000
Subject: Re: [PATCH][V2] arcnet: capmode: remove redundant assignment to pointer pkt
Message-Id: <20190830.141508.762893998883327616.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190828231450.22424-1-colin.king@canonical.com>
In-Reply-To: <20190828231450.22424-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: m.grzeschik@pengutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Aug 2019 00:14:50 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer pkt is being initialized with a value that is never read
> and pkt is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
> 
> Addresses-Coverity: ("Ununsed value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo in patch description, pkg -> pkt

Applied to net-next.
