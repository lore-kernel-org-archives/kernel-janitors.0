From: David Miller <davem@davemloft.net>
Date: Fri, 31 May 2019 21:34:43 +0000
Subject: Re: [PATCH][next] nexthop: remove redundant assignment to err
Message-Id: <20190531.143443.1986779233923573190.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530155754.31634-1-colin.king@canonical.com>
In-Reply-To: <20190530155754.31634-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 16:57:54 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is initialized with a value that is never read
> and err is reassigned a few statements later. This initialization
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
