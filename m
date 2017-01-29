From: David Miller <davem@davemloft.net>
Date: Sun, 29 Jan 2017 23:24:27 +0000
Subject: Re: [PATCH][next-next] net: ethernet: aquantia: return -ETIME in macro AQ_HW_WAIT_FOR
Message-Id: <20170129.182427.1212745842603180686.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127150646.19181-1-colin.king@canonical.com>
In-Reply-To: <20170127150646.19181-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Pavel.Belous@aquantia.com, Alexander.Loktionov@aquantia.com, Dmitry.Bezrukov@aquantia.com, vomlehn@texas.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Jan 2017 15:06:46 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The macro is returning ETIME which means various checks to see if
> the returned err is less than zero never work. I believe a -ETIME
> should be returned instead.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
