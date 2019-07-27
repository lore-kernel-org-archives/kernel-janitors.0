From: David Miller <davem@davemloft.net>
Date: Sat, 27 Jul 2019 20:32:20 +0000
Subject: Re: [PATCH] net: neigh: remove redundant assignment to variable bucket
Message-Id: <20190727.133220.1577010813654823977.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190726094611.3597-1-colin.king@canonical.com>
In-Reply-To: <20190726094611.3597-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dsahern@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Jul 2019 10:46:11 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable bucket is being initialized with a value that is never
> read and it is being updated later with a new value in a following
> for-loop. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
