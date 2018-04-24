From: David Miller <davem@davemloft.net>
Date: Tue, 24 Apr 2018 20:02:25 +0000
Subject: Re: [PATCH] net/tls: remove redundant second null check on sgout
Message-Id: <20180424.160225.1434022836243113911.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424123658.6541-1-colin.king@canonical.com>
In-Reply-To: <20180424123658.6541-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: ilyal@mellanox.com, aviadye@mellanox.com, davejwatson@fb.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Apr 2018 13:36:58 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> A duplicated null check on sgout is redundant as it is known to be
> already true because of the identical earlier check. Remove it.
> Detected by cppcheck:
> 
> net/tls/tls_sw.c:696: (warning) Identical inner 'if' condition is always
> true.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thank you.
