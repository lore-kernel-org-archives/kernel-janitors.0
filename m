From: David Miller <davem@davemloft.net>
Date: Tue, 21 Jul 2009 20:01:49 +0000
Subject: Re: [PATCH] drivers/net/mlx4: Adjust constant
Message-Id: <20090721.130149.71286172.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191809050.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191809050.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 18:09:25 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> The values in the advertising field are typically ADVERTISED_xxx, not
> SUPPORTED_xxx.  Both SUPPORTED_10000baseT_Full and
> ADVERTISED_1000baseT_Full have the same value.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
