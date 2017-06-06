From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jun 2017 16:22:50 +0000
Subject: Re: [PATCH][net-next] net/mlxfw: remove redundant goto on error check
Message-Id: <20170606.122250.1431459979681086413.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170606104740.15712-1-colin.king@canonical.com>
In-Reply-To: <20170606104740.15712-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yotamg@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  6 Jun 2017 11:47:40 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check to see of err is set and the subsequent goto is extraneous
> as the next statement is where the goto is jumping to. Remove this
> redundant check and goto.
> 
> Detected by CoverityScan, CID#1437734 ("Identical code for
> different branches")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
