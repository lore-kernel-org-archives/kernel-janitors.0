From: David Miller <davem@davemloft.net>
Date: Fri, 04 Jun 2010 23:13:06 +0000
Subject: Re: [PATCH 21/27] drivers/ide: Use memdup_user
Message-Id: <20100604.161306.102569610.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221024470.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221024470.13021@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 22 May 2010 10:25:03 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Use memdup_user when user data is immediately copied into the
> allocated region.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, t hanks Julia.
