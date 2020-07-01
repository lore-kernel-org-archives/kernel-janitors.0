From: David Miller <davem@davemloft.net>
Date: Wed, 01 Jul 2020 19:45:15 +0000
Subject: Re: [PATCH] net/packet: remove redundant initialization of variable err
Message-Id: <20200701.124515.499720144057095714.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200701150433.551656-1-colin.king@canonical.com>
In-Reply-To: <20200701150433.551656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 Jul 2020 16:04:33 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
