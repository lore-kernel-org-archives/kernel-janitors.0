From: David Miller <davem@davemloft.net>
Date: Tue, 10 Oct 2017 17:54:47 +0000
Subject: Re: [PATCH][net-next] ipv6: fix dereference of rt6_ex before null check error
Message-Id: <20171010.105447.757260394877902006.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171010170116.21124-1-colin.king@canonical.com>
In-Reply-To: <20171010170116.21124-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 10 Oct 2017 18:01:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently rt6_ex is being dereferenced before it is null checked
> hence there is a possible null dereference bug. Fix this by only
> dereferencing rt6_ex after it has been null checked.
> 
> Detected by CoverityScan, CID#1457749 ("Dereference before null check")
> 
> Fixes: 81eb8447daae ("ipv6: take care of rt6_stats")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
