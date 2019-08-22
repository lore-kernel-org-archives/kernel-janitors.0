From: David Miller <davem@davemloft.net>
Date: Thu, 22 Aug 2019 19:14:30 +0000
Subject: Re: [PATCH] nexthops: remove redundant assignment to variable err
Message-Id: <20190822.121430.1623821241154451911.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822125340.30783-1-colin.king@canonical.com>
In-Reply-To: <20190822125340.30783-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dsahern@kernel.org, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Aug 2019 13:53:40 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable err is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused Value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
