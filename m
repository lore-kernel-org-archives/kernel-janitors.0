From: David Miller <davem@davemloft.net>
Date: Sun, 29 Jan 2017 23:24:15 +0000
Subject: Re: [PATCH][net-next] net: ethernet: aquantia: remove redundant err check
Message-Id: <20170129.182415.414553797234358867.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127144346.18565-1-colin.king@canonical.com>
In-Reply-To: <20170127144346.18565-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Pavel.Belous@aquantia.com, Alexander.Loktionov@aquantia.com, Dmitry.Bezrukov@aquantia.com, vomlehn@texas.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Jan 2017 14:43:46 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check on err < 0 is redundant and can be removed. Detected
> by CoverityScan, CID#1398321 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
